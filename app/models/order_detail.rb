class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum craft_status: {impossible: 0, before_craft: 1, crafting: 2, complete: 3}
end
