class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    if @customer.is_active
      @customer_status = "有効"
    else
      @customer_status = "退会"
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end

end
