class BrandSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :ean_prefix
end
