class Product < ApplicationRecord

  has_many :carts, dependent: :destroy
  has_many :order_products
  belongs_to :genre,optional: true

  attachment :image

  validates :genre_id, :image, :name, :description, :tax_excluded_price, :sale_status, presence: true

  def tax_include
    tax = 1.10
    (tax_excluded_price * tax).round
  end
  
  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end

end
