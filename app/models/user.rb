class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 50 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  validates :image, presence: true
  before_validation {email.downcase!}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :blogs
  has_many :favorites, dependent: :destroy
end
