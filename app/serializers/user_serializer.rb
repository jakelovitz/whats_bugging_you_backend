class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :phone_number, :complaint_types, :complaints, :reactions
end
