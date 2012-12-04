class Card < ActiveRecord::Base
  extend Enumerize
  belongs_to :destination
  has_many :comments
  enumerize :status, in: [:in_progress, :ready, :sent], predicates: true
  validates :destination_id, presence: true
  validates :status, inclusion: { in: status.values }
  validates :access_token, uniqueness: { allow_nil: true }
  attr_accessible :status

  def written_members
    Member.where(Member.arel_table[:id].in(Comment.where(card_id: id).select(:member_id).uniq.arel))
    # SELECT * FROM members WHERE members.id IN (SELECT DISTINCT member_id FROM comments WHERE comments.card_id == {id})
  end

  def unwritten_members
    Member.where(Member.arel_table[:id].not_in(Comment.where(card_id: id).select(:member_id).uniq.arel))
    # SELECT * FROM members WHERE members.id NOT IN (SELECT DISTINCT member_id FROM comments WHERE comments.card_id == {id})
  end

  def generate_access_token
    if access_token.blank?
      self.access_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
    end
  end
end
