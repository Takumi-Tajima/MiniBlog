class Relationship < ApplicationRecord
  # ユーザーAがユーザーBをフォローする場合、ユーザーAが follower
  # ユーザーAがユーザーBをフォローする場合、ユーザーBが followed
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
