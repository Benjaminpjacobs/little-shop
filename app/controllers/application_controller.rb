class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cart
  
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  private

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
end
