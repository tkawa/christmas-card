class Destination < ActiveRecord::Base
  validates :email, uniqueness: { allow_blank: true }
  attr_accessible :email, :name
end
