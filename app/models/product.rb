class Product < ApplicationRecord

  has_many :carts, dependent: :destroy
  has_many :order_products
  belongs_to :genre,optional: true
  has_many :orders,through: :order_products

  attachment :image

  validates :genre_id, :image, :name, :description, :tax_excluded_price, presence: true
  validates :sale_status, inclusion: { in: [true, false] }


  def tax_include
    tax = 1.10
    (tax_excluded_price * tax).round
  end

  def self.search_for(value)
    #return Product.all unless search
    Product.where(['name LIKE ?', "%#{value}%"]).or(Product.where(genre_id: value))
  end


end
