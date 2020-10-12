# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :name, length: { in: 2..50 }
  validates :password, length: { in: 5..40 }, allow_blank: true
  has_secure_password
  has_many :reads, dependent: :destroy
  has_many :books, through: :reads

  has_many :plays, dependent: :destroy
  has_many :games, through: :plays
end
