class Reply < ActiveRecord::Base
  belongs_to :card
  validates :card_id, :presence => true
  attr_accessible :body, :name
end
