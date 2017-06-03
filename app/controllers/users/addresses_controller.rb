class Users::AddressesController < ApplicationController
  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_path
    else
    end
  end

  def new
    @address = Address.new
    @current_path = params[:current_path] if params[:current_path]
  end

private

  def address_params
    params.require(:address).permit(:street_address, city_attributes: [:name], state_attributes: [:name], zipcode_attributes:[:number])
  end

  def current_path
    params.require(:address).permit(:current_path)[:current_path]
  end

  def redirect_path
    if current_path == carts_path
      redirect_to user_orders_path(current_user.id), :method => :post
    else
      redirect_to dashboard_index
    end
  end

end
