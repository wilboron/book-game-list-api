# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TokensController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/tokens').to route_to('api/v1/tokens#create', format: :json)
    end
  end
end
