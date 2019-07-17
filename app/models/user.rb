class User < ApplicationRecord
    has_many :complaint_types
    has_many :complaints, through: :complaint_types

    validates :username, uniqueness: true
    
    has_secure_password
end
