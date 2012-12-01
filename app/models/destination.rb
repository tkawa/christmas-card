class Destination < ActiveRecord::Base
  has_one :card
  validates :email, uniqueness: { allow_blank: true }
  attr_accessible :email, :name
end
