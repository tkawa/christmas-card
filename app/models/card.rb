class Card < ActiveRecord::Base
  extend Enumerize
  belongs_to :destination
  has_many :comments
  enumerize :status, in: [:in_progress, :ready, :sent], predicates: true
  validates :destination_id, presence: true
  validates :status, inclusion: { in: status.values }
  attr_accessible :status

  def unwritten_members
    Member.where(Member.arel_table[:id].not_in(Comment.where(card_id: id).select(:member_id).uniq.arel))
    # SELECT * FROM members WHERE members.id NOT IN (SELECT DISTINCT member_id FROM comments WHERE comments.card_id == {id})
  end
end
