require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    subject(:author) { build(:author) }

    it 'is valid with valid attributes' do
      expect(author).to be_valid
    end

    it { expect(author).to validate_presence_of(:name) }
    it { expect(author).to have_many(:books) }
  end
end
