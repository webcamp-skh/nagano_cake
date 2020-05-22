class Address < ApplicationRecord

	belongs_to :user

	#バリデーション
	validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
	validates :address, presence: true
	validates :receiver_name, presence: true
end
