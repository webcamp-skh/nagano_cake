class Item < ApplicationRecord

	 attachment :image
	 has_many :cart_items, dependent: :destroy
   has_many :order_items
	 belongs_to :genre

end
