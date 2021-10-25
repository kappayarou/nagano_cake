class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {waiting_payment: 0, confirm_payment: 1, crafting: 2, posting_preparation: 3, posted: 4}

end
