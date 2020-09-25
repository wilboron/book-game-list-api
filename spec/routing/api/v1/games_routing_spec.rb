# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/games').to route_to('api/v1/games#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/games/1').to route_to('api/v1/games#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/v1/games').to route_to('api/v1/games#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/games/1').to route_to('api/v1/games#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/games/1').to route_to('api/v1/games#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/games/1').to route_to('api/v1/games#destroy', id: '1', format: :json)
    end
  end
end
