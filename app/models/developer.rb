# frozen_string_literal: true

class Developer < ApplicationRecord
  validates :name, presence: true
  has_many :games, dependent: :destroy
end
