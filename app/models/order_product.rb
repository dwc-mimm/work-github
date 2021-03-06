class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product


  validates :product_id, :order_id, :product_quantity, :tax_included_price, :production_status, presence: true

  enum production_status: {'着手不可': 0, '製作待ち': 1, '製作中': 2, '製作完了': 3}
  
  def subtotal
    self.product_quantity * self.product.tax_excluded_price
  end
  
end
