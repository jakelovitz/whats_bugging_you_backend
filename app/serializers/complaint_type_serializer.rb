class ComplaintTypeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :color
end
