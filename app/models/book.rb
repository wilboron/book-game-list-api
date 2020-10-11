# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :num_pages, :genre, :pub_date, presence: true
  belongs_to :author
end
