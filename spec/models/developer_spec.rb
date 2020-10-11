require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'validations' do
    subject(:developer) { build(:developer) }

    it 'is valid with valid attributes' do
      expect(developer).to be_valid
    end

    it { expect(developer).to validate_presence_of(:name) }
    it { expect(developer).to have_many(:games) }
  end
end
