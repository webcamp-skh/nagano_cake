class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: { not_ready: 0, waiting: 1, doing: 2, done: 3 }
end
