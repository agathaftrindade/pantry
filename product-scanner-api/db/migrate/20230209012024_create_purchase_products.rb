class CreatePurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_products do |t|

      t.belongs_to :purchase, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.string :quantity_type
      t.datetime :expires_at

      t.timestamps
    end
  end
end
