class CustomersController < ApplicationController
  before_action :genre_search
  before_action :authenticate_customer!, only: [:show]


  def genre_search
    @genres = Genre.all
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_path
  end

  def alert
  end

  def leave
    customer = current_customer
    customer.is_active = "false"
    customer.save
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
