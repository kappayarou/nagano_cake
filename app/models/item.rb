class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, :order_details
end