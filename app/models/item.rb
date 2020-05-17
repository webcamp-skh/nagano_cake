class Item < ApplicationRecord

	 attachment :image
	 belongs_to :cart_item
	 belongs_to :genre

end
