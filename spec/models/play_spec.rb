# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Play, type: :model do
  describe 'validations' do
    subject(:play) { build(:play) }

    it 'is valid with valid attributes' do
      expect(play).to be_valid
    end

    it { expect(play).to validate_presence_of(:plataform) }
    it { expect(play).to validate_presence_of(:start_date) }
    it { expect(play).not_to validate_presence_of(:end_date) }
    it { expect(play).to belong_to(:game) }
    it { expect(play).to belong_to(:user) }

    it 'is invalid with start_date in the future' do
      play.start_date = 1.day.from_now
      expect(play).not_to be_valid
    end

    it 'is invalid with start_date before end_date' do
      play.end_date = play.start_date.yesterday
      expect(play).not_to be_valid
    end
  end
end
