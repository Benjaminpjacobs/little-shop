class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  enum status: [:ordered, :paid, :cancelled, :completed]

  def total
    self.items.sum(:price)
  end
  
  def add_items(cart)
    cart.contents.each do |item_id, item_qty|
      self.order_items.create(item_id: item_id, qty: item_qty)
    end
  end

end