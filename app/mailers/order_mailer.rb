class OrderMailer < ApplicationMailer
  default from: "rpo.accessories@gmail.com"

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Order: #{@order.id} Confirmation")
  end

end
