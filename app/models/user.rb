class User < ApplicationRecord
  has_one_attached :user_photo
  validates :name, presence: true
end