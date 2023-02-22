class Purchase < ApplicationRecord
  has_many :items,  class_name: 'PurchaseProduct', foreign_key: 'purchase_id'
end
