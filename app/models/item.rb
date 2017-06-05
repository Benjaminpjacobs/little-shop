class Item < ApplicationRecord
  validates :name, :description, :price, :status, presence: :true
  validates :name, uniqueness: :true
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  enum status: [:available, :retired]
end
