class PurchaseProduct < ApplicationRecord
  belongs_to :purchase, class_name: 'Purchase'
  belongs_to :product

  enum quantity_type: [ :UNIT, :WEIGHTED ]

  validates :purchase,
            :product,
            :price,
            :quantity,
            :quantity_type,
            :presence => true

end
