class Order < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :user
  enum payment_method: { credit: 0, bank: 1 }
  enum order_status: { pending: 0, confirm: 1, making: 2, ready: 3, complete: 4 }
end