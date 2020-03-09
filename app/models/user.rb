class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_many :works, foreign_key: :author_id
end
