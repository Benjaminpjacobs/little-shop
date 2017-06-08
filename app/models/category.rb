class Category < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  def slug
    title.downcase.gsub(" ", "-")
  end

  def to_param
    "#{slug}"
  end

  def featured_category_items
    items.sample(4)
  end

end
