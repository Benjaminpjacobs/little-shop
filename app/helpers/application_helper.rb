module ApplicationHelper
  def admin_orders
    binding.pry
    {
    ordered: Orders.where(status: 0),
    paid: Orders.where(status: 0),
    cancelled: Orders.where(status: 0),
    completed: Orders.where(status: 0)
  }
  end
end
