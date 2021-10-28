class AddressesController < ApplicationController
  before_action :authenticate_customer!, only: [:index]

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
