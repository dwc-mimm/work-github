class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :image_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :tax_excluded_price, null: false
      t.boolean :sale_statsu, defalt: true, null: false

      t.timestamps
    end
  end
end
