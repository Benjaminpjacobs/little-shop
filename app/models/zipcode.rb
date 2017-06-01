class Zipcode < ApplicationRecord
  validates :number, presence: true
  has_many :addresses
end
