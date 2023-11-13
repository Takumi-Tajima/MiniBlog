class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  validates :name, presence: true, format: { with: /\A[a-z]+\z/, message: "英文字のみが使えます" }, length: { maximum: 20 }
  validates :email, presence: true
  validates :profile, length: { maximum: 200 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
