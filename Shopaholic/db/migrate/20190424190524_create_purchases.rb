class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, index: true , null: false
      t.decimal :total_price

      t.timestamps
    end
  end
end
