# frozen_string_literal: true

class Play < ApplicationRecord
  validates_date :start_date, on_or_before: -> { Date.current }
  validates_date :end_date, on_or_after: :start_date
  validates :plataform, :start_date, presence: true
  belongs_to :game
  belongs_to :user
end
