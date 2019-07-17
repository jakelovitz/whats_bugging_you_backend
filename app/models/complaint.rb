class Complaint < ApplicationRecord
    belongs_to :complaint_type
    has_many :reactions
end
