class Product < ApplicationRecord

  has_many :carts, dependent: :destroy
  has_many :order_products
  belongs_to :genre

  attachment :image

  validates :genre_id, :image_id, :name, :description, :tax_excluded_price, :sale_status, presence: true

end
