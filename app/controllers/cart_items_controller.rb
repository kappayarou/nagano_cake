class CartItemsController < ApplicationController

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_items = current_customer.cart_items
    cart_item_base = cart_items.find_by(item_id: cart_item.item.id)
    if cart_item_base
      cart_item_base.amount = cart_item_base.amount + cart_item.amount
      cart_item_base.save
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def index
    @cart_items = current_customer.cart_items
    @list = (1..10).to_a
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
