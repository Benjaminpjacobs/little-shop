class Users::AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
    @return_path = params[:return]
  end

  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    if @address.save
      flash[:success] = 'Address was successfully saved'
      redirect_to return_path
    else
      render :new
    end
  end
  
  def update
    @address.update(address_params)
    if @address.save
      flash[:success] = 'Address updated successfully!'
      redirect_to dashboard_index_path
    else
      render :edit
    end
  end

  def destroy
    @address.delete
    flash[:success] = 'Successfully Deleted Address!'
    redirect_to dashboard_index_path
  end

private

    def address_params
      params.require(:address)[:address_type] = params.require(:address)[:address_type].to_i
      params.require(:address).permit(:street_address, :address_type, city_attributes: [:name], state_attributes: [:name], zipcode_attributes:[:number])
    end

    def return_path
      params.require(:address).permit(:return)[:return]
    end

    def set_address
      @address = Address.find(params[:id])
    end
end
