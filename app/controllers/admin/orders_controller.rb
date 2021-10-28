class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @statuses = {Order.statuses_i18n[:waiting_payment] => :waiting_payment, Order.statuses_i18n[:confirm_payment] => :confirm_payment, Order.statuses_i18n[:crafting] => :crafting, Order.statuses_i18n[:posting_preparation] => :posting_preparation, Order.statuses_i18n[:posted] => :posted}
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == 1
      order_details = order.order_details
      order_details.each do |order_detail|
        order_detail.craft_status = 1
        order_detail.save
      end
    end
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
