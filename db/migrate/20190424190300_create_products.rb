class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :details
      t.decimal :price
      t.integer :stock
      t.string :image_path

      t.timestamps
    end
  end
end
