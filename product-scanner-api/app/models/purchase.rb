class Purchase < ApplicationRecord
  has_many :products, class_name: 'PurchaseProduct'
end
