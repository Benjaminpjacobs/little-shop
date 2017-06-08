class Item < ApplicationRecord
  validates :name, :description, :price, :status, presence: :true
  validates :name, uniqueness: :true
  has_attached_file :image, :url => '/:class/:attachment/:id/:style_:basename.:extension'
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  enum status: [:available, :retired]

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def character_limit(text, num)
    if text.length <= num
      text
    else
      "#{text[0...num]}..."
    end
  end

  def self.featured_items
    featured_items = []
    featured_items << find_by(image_file_name: 'apparel009.png')
    featured_items << find_by(image_file_name: 'personal_transport017.png')
    featured_items << find_by(image_file_name: 'supplies018.png')
    featured_items
  end
end
