# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  describe 'includes the correct concerns' do
    it { expect(described_class.ancestors.include?(Authenticable)).to eq(true) }
  end
end
