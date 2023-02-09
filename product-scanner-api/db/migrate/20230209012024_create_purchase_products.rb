class CreatePurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_products do |t|
      t.decimal :price
      t.integer :quantity
      t.string :quantity_type
      t.datetime :expires_at

      t.timestamps
    end
  end
end
