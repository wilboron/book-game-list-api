# frozen_string_literal: true

class Game < ApplicationRecord
  validates :title, :developer, :genre, :pub_date, presence: true
  belongs_to :developer

  has_many :plays, dependent: :restrict_with_exception
  has_many :users, through: :plays
end
