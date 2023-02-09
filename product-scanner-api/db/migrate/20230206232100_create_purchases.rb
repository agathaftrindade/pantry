class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.datetime :event_datetime
      t.string :location
      t.text :comment

      t.timestamps
    end
  end
end
