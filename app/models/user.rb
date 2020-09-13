class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :name, length: { in: 2..50 }
  validates :password, length: { in: 5..40 }
  has_secure_password
end
