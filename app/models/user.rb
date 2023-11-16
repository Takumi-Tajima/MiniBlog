class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  # ユーザーがアクティブにフォローしている関係（自分がフォローしている関係）を表現
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしているユーザー（フォローしている側）のリストを表現
	has_many :followings, through: :active_relationships, source: :followed
  # ユーザーが受動的にフォローされている関係（自分をフォローしている関係）を表現
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローされる側からフォローしているユーザを取得する
	has_many :followers, through: :passive_relationships, source: :follower
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "英文字のみが使えます" }, length: { maximum: 20 }
  validates :email, presence: true
  validates :profile, length: { maximum: 200 }
  paginates_per 10
end
