class Cart < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :product_id, :customer_id, :product_quantity, presence :true
end
