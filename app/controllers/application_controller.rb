class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :load_cart

  helper_method :current_user
  helper_method :current_guest

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user.admin? if current_user
  end

  def current_guest
    if current_user
      current_user.role
    else
      "guest"
    end
  end

  private

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
end
