class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end

  def order_confirmation
    UserMailer.order_confirmation(User.first, Order.first)
  end
end
