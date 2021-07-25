class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :carts, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :orders

  # def active_for_authentication?
  #   self.is_deleted == false
  # end

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted, presence: true
  # enum is_deleted: { 有効: false, 退会: true }
  #boolean箇所正しい記述か不明です
  
end
