class OrderItem < ApplicationRecord
  validates :qty, presence: true
  belongs_to :order
  belongs_to :item
end