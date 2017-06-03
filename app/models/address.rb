class Address < ApplicationRecord
  validates :address_type, presence: true
  belongs_to :user
  belongs_to :city
  belongs_to :state
  belongs_to :zipcode
  enum address_type: [:home, :billing]
  accepts_nested_attributes_for :city, :state, :zipcode
end
