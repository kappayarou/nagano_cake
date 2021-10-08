class OrderDetail < ApplicationRecord
  belongs_to :order, :item
end
