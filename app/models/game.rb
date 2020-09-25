# frozen_string_literal: true

class Game < ApplicationRecord
  validates :title, :developer, :genre, :pub_date, presence: true
end
