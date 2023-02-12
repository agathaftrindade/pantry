class PurchaseSerializer < ActiveModel::Serializer
  attributes :id,
             :event_datetime,
             :location,
             :comment
end
