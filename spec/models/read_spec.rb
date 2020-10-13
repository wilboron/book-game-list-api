# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Read, type: :model do
  describe 'validations' do
    subject(:read) { build(:read) }

    it 'is valid with valid attributes' do
      expect(read).to be_valid
    end

    it { expect(read).to validate_presence_of(:medium) }
    it { expect(read).to validate_presence_of(:start_date) }
    it { expect(read).not_to validate_presence_of(:end_date) }
    it { expect(read).to belong_to(:book) }
    it { expect(read).to belong_to(:user) }

    it 'is invalid with start_date in the future' do
      read.start_date = 1.day.from_now
      expect(read).not_to be_valid
    end

    it 'is invalid with start_date before end_date' do
      read.end_date = read.start_date.yesterday
      expect(read).not_to be_valid
    end
  end
end
