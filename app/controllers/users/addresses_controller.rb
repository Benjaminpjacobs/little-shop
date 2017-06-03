class Users::AddressesController < ApplicationController
  def create

    binding.pry
    redirect_to current_path
  end

  def new
    @address = Address.new
    @current_path = params[:current_path] if params[:current_path]
  end

private

  def address_params
    params.require(:address).permit(:street_address)
  end

  def city_params
    params.require(:city).permit(:name)
  end

  def state_params
    params.require(:state).permit(:name)
  end

  def zipcode_params
    params.require(:zipcode).permit(:number)
  end

end
