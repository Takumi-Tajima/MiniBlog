# frozen_string_literal: true

class Micropost < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
end
