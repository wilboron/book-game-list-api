class Read < ApplicationRecord
  validates_date :start_date, on_or_before: -> { Date.current }
  validates_date :end_date, on_or_after: :start_date
  validates :medium, :start_date, presence: true
  belongs_to :book
  belongs_to :user
end
