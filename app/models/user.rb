class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders

  def active_for_authentication?
  	super && (self.status == true)
  end

  # バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
  validates :address, presence: true
  validates :phone_number, length: {in: 10..11}, numericality: {only_integer: true}
end
