class Card < ActiveRecord::Base
  extend Enumerize
  belongs_to :destination
  has_many :messages
  has_many :replies
  enumerize :status, in: [:in_progress, :ready, :sent], predicates: true
  validates :destination_id, presence: true
  validates :status, inclusion: { in: status.values }
  validates :access_token, uniqueness: { allow_nil: true }
  attr_accessible :status

  before_validation :generate_access_token

  def written_members
    Member.where(Member.arel_table[:id].in(Message.where(card_id: id).select(:member_id).uniq.arel))
    # SELECT * FROM members WHERE members.id IN (SELECT DISTINCT member_id FROM messages WHERE messages.card_id == {id})
  end

  def unwritten_members
    Member.where(Member.arel_table[:id].not_in(Message.where(card_id: id).select(:member_id).uniq.arel))
    # SELECT * FROM members WHERE members.id NOT IN (SELECT DISTINCT member_id FROM messages WHERE messages.card_id == {id})
  end

  def generate_access_token
    if in_progress?
      self.access_token = nil
    elsif ready? || sent?
      self.access_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
    end
  end
end
