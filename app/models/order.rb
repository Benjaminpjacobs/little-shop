class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  enum status: [:ordered, :paid, :cancelled, :completed]
  after_update :update_date

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

  def update_date
    case status
    when 'paid'
      self.update_attributes(:paid_date => updated_at) if paid_date.nil?
    when 'cancelled'
      self.update_attributes(:cancelled_date => updated_at) if cancelled_date.nil?
    when 'completed'
      self.update_attributes(:completed_date => updated_at) if completed_date.nil?
    end
    
  end


end
