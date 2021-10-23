class ItemsController < ApplicationController

  before_action :tax_rate
  before_action :genre_search

  def tax_rate
    @tax_rate = 1.1
  end

  def genre_search
    @genres = Genre.all
  end

  def index
    @items = Item.page(params[:page]).per(8)
    @item_count = Item.all.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    list = (1..10).to_a
    @item_amount = ["個数選択", list].flatten
  end

end
