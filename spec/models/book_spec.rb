# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject(:book) { build(:book) }

    it 'is valid with valid attributes' do
      expect(book).to be_valid
    end

    it { expect(book).to validate_presence_of(:title) }
    it { expect(book).to validate_presence_of(:num_pages) }
    it { expect(book).to validate_presence_of(:genre) }
    it { expect(book).to validate_presence_of(:pub_date) }
    it { expect(book).not_to validate_presence_of(:serie) }
    it { expect(book).to belong_to(:author) }
  end
end
