# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :author, :num_pages, :genre, :pub_date, presence: true
end
