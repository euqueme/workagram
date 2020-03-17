class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 25 }
  validates :fullname, presence: true, length: { minimum: 6, maximum: 100 }

  has_many :works, foreign_key: :author_id

  has_many :followings, class_name: 'Following',
                        foreign_key: 'follower_id',
                        dependent: :destroy

  has_many :reverse_followings, class_name: 'Following',
                                foreign_key: 'followed_id',
                                dependent: :destroy

  has_many :following, through: :followings, source: :followed
  has_many :followers, through: :reverse_followings, source: :follower

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  mount_uploader :coverimage, PictureUploader
  mount_uploader :photo, PictureUploader
end
