class Users::AddressesController < ApplicationController

  def new
    @address = Address.new
    @return_path = params[:return]
  end

  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    if @address.save
      flash[:success] = "Address was successfully saved"
      redirect_to return_path
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      flash[:success] = "Address updated successfully!"
      redirect_to dashboard_index_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.delete

    flash[:success] = "Successfully Deleted Address!"
    redirect_to dashboard_index_path
  end


private

  def address_params
    p = params.require(:address).permit(:street_address, :address_type, city_attributes: [:name], state_attributes: [:name], zipcode_attributes:[:number])
    p[:address_type] = p[:address_type].to_i
    p
  end

  def return_path
    params.require(:address).permit(:return)[:return]
  end

  # def redirect_path
  #   if return_path == dashboard_index_path
  #   end
  # end
end
