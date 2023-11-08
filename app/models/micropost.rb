# frozen_string_literal: true

class Micropost < ApplicationRecord
  has_many :microposts
  validates :content, presence: true, length: { maximum: 140 }
end
