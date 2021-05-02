class Relationship < ApplicationRecord

  # belongs_to :user
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # has_many :followers, :through => :passive_relationships, source: :user

  validates :followed_id, presence: true
  validates :follower_id, presence: true

end
