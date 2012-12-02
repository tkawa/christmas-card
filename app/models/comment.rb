class Comment < ActiveRecord::Base
  belongs_to :card
  belongs_to :member
  validates :card_id, :member_id, presence: true
  attr_accessible :member_id, :body
end
