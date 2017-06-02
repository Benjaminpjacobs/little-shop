class PrivateController < ApplicationController
  before_action :require_user

  def require_user
    render file: "/public/404" unless current_user
  end
end