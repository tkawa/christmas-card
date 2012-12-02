class Member < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true
  attr_accessible :image_url, :name
end
