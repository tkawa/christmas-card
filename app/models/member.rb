class Member < ActiveRecord::Base
  validates :name, presence: true
  attr_accessible :image_url, :name
end
