class User < ApplicationRecord
  validates :email, uniqueness: true
  validate :email, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :name, length: { in: 2..50 }
  validates :password, length: { in: 5..40 }
  has_secure_password
end
