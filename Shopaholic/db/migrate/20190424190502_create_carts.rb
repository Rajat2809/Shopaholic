class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, index: true , null: false
      t.references :product, index: true , null: false
      t.integer :quantity
      t.decimal :total_price
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
