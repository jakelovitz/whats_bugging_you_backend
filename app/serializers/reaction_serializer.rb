class ReactionSerializer < ActiveModel::Serializer
  attributes :id, :complaint_id, :user_id, :updated_severity, :cooldown_thoughts
end
