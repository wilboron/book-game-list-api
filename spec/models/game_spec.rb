# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    subject(:game) { build(:game) }

    it 'is valid with valid attributes' do
      expect(game).to be_valid
    end

    it { expect(game).to validate_presence_of(:title) }
    it { expect(game).to validate_presence_of(:genre) }
    it { expect(game).to validate_presence_of(:pub_date) }
    it { expect(game).not_to validate_presence_of(:serie) }
    it { expect(game).to belong_to(:developer) }
  end
end
