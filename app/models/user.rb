class User < ApplicationRecord
  has_one_attached :user_photo
  validates :name, presence: true

  def self.count_by_status(status)
    where(status: status).count
  end
end