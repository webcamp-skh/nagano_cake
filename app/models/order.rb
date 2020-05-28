class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :user
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  validates :payment_method, presence: true
  validates :ordered_postal_code, presence: true
  validates :ordered_address, presence: true
  validates :ordered_receiver_name, presence: true

end

