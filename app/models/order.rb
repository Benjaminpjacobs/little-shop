class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: [:ordered, :paid, :cancelled, :completed]

  def total
    self.items.sum(:price)
  end

  def line_item_subtotal(item_id)
    item = Item.find(item_id)
    item.price * self.order_items.find_by(item_id: item.id).qty
  end

  def add_items(cart)
    cart.contents.each do |item_id, item_qty|
      self.order_items.create(item_id: item_id, qty: item_qty)
    end
  end

end