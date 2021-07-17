class Delivery < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :name, :postcode, :address, presence: true
end
