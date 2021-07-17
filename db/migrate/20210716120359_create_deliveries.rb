class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|

      t.integer :customer_id, null: false
      t.string :name
      t.string :postcode
      t.string :address
      t.timestamps
    end
  end
end
