class PurchaseProductSerializer < ActiveModel::Serializer
  attributes :id,
             :price,
             :quantity,
             :quantity_type,
             :expires_at

  belongs_to :product
end
