class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

      t.integer :product_id, null: false
      t.integer :customer_id, null: false
      t.integer :product_quantity, null: false
      t.timestamps
    end
  end
end
