class Users::AddressesController < ApplicationController

  def new
    @address = Address.new
    @current_path = params[:current_path] if params[:current_path]
  end

  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    if @address.save
      flash[:success] = "Address was successfully saved"
      redirect_to redirect_path
    else
      render :new
    end
  end


private

  def address_params
    params.require(:address).permit(:street_address, city_attributes: [:name], state_attributes: [:name], zipcode_attributes:[:number])
  end

  def current_path
    params.require(:address).permit(:current_path)[:current_path]
  end

  def redirect_path
    if current_path == dashboard_index_path
      current_path
    else
      carts_path
    end
  end
end
