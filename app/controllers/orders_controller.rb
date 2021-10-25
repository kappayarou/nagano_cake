class OrdersController < ApplicationController

  def new
    @order = Order.new
    postal_values = current_customer.addresses
    @postal_value_list = {}
    postal_values.each do |postal_value|
      postal_code = postal_value.postal_code
      address = postal_value.address
      postal = postal_code + " " + address
      @postal_value_list.store(postal, postal_value.id)
    end
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:radio_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:radio_number] == "2"
      address = Address.find(params[:order][:select_address])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
    @cart_items = current_customer.cart_items
    billing =[]
    @cart_items.each do |cart_item|
      subtotal = (cart_item.item.price * cart_item.amount).to_i
      billing.append(subtotal)
    end
    @postage = 800
    @order.customer_id = current_customer.id
    @order.postage = @postage
    billing = billing.sum + @postage
    @order.billing = billing

    @confirm = Order.new
  end

  def order
  end

  def create
    @confirm = Order.new(order_params)
    @confirm.customer_id = current_customer.id
    if @confirm.save
      current_customer.cart_items.destroy_all
      redirect_to orders_order_path
    end
  end

  def index
    @orders = current_customer.orders
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing)
  end

end
