class Item < ApplicationRecord
  validates :name, :description, :price, :status, presence: :true
  validates :name, uniqueness: :true
end
