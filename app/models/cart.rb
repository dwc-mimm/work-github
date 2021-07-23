class Cart < ApplicationRecord

  belongs_to :product
  belongs_to :customer

 validates :product_id, :customer_id, :product_quantity, presence: true

 def subtotal
    self.product_quantity * self.product.tax_excluded_price
 end
end
