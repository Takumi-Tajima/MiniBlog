class User < ApplicationRecord
  has_many :micropost
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
