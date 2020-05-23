class Item < ApplicationRecord

  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
