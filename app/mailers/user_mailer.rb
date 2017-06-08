class UserMailer < ApplicationMailer
  default from: "rpo.accessories@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://ready-player-one.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome Player One")
  end

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Order: #{@order.id} Confirmation")
  end

end
