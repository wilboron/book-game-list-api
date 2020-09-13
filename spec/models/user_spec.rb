# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to have_secure_password }
    it { expect(user).not_to validate_presence_of(:bio) }
    it { expect(user).to validate_length_of(:name).is_at_least(2).is_at_most(50) }
    it { expect(user).to validate_length_of(:password).is_at_least(5).is_at_most(40) }
  end
end
