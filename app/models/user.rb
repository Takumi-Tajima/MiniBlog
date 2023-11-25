class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :feeds, through: :followings, source: :microposts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "英文字のみが使えます" }, length: { maximum: 20 }
  validates :email, presence: true
  validates :profile, length: { maximum: 200 }
  paginates_per 10

  def follow(other_user)
    followings << other_user unless self == other_user
  end

  def unfollow(other_user)
    followings.delete(other_user)
  end

  def following?(user)
    followings.include?(user)
  end
end
