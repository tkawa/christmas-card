class Card < ActiveRecord::Base
  extend Enumerize
  belongs_to :destination
  has_many :comments
  enumerize :status, in: [:in_progress, :ready, :sent], predicates: true
  validates :destination_id, presence: true
  validates :status, inclusion: { in: status.values }
  attr_accessible :status
end
