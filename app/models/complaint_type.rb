class ComplaintType < ApplicationRecord
    belongs_to :user
    has_many :complaints
end
