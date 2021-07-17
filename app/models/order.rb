class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy

  validates :customer_id, :payment, :payment_method, :name, :postcode, :address, presence: true

  enum payment_method: {"銀行振込": 0, "クレジットカード": 1}
  enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

end
