class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
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

  def self.admin_orders
    {
    ordered: Order.where(status: 0),
    paid: Order.where(status: 1),
    cancelled: Order.where(status: 2),
    completed: Order.where(status: 3)
  }
  end

  


end
