class Work < ApplicationRecord
    belongs_to :author, class_name: "User"
    scope :sorted_by_most_recent, -> { order(created_at: :desc) }


    
end
