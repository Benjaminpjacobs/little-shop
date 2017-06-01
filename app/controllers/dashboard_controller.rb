class DashboardController < ApplicationController
  before_action :require_user


  def index
  end

  private

  def require_user
    render file: "/public/404" unless current_user
  end
end
