class Order < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :user
  enum payment_method: { credit: 0, bank: 1 }
end