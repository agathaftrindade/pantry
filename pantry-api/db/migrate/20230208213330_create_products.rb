class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :brand, foreign_key: true
      t.string :gtin
      t.string :photo_url

      t.timestamps
    end
  end
end
