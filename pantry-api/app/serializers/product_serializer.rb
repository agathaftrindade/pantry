class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :gtin

  belongs_to :brand

end
