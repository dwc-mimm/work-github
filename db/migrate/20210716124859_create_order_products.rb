class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id, null: false
      t.integer :order_id, null: false
      t.integer :product_quantity, null: false
      t.integer :tax_included_price, null: false
      t.integer :production_status, default: 0, null: false
      t.timestamps
    end
  end
end
