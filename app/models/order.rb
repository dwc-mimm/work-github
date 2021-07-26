class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :products,through: :order_products

  validates :customer_id, :payment, :payment_method, :name, :postcode, :address, presence: true

  enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
  enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

 def subtotal
    self.product_quantity * self.product.tax_excluded_price
 end

end
