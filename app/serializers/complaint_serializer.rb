class ComplaintSerializer < ActiveModel::Serializer
  attributes :id, :complaint_type_id, :severity, :complaint_text
end
