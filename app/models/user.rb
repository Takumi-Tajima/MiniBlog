class User < ApplicationRecord
  has_many :microposts
  paginates_per 10
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
