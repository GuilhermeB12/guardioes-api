class SchoolUnit < ApplicationRecord
    belongs_to :user, optional:true
    belongs_to :household
end
