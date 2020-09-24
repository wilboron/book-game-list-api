# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tokens', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user, password: password) }
    let(:password) { 'correct_password' }

    context 'when user is valid' do
      let(:params) { { user: { email: user.email, password: password } } }

      before { post api_v1_tokens_url, params: params, as: :json }

      it 'returns a successful response', :aggregate_failures do
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(json_response['token']).not_to be_nil
        expect(json_response['email']).to eq(user.email)
      end
    end

    context 'when user is invalid' do
      let(:params) { { user: { email: user.email, password: 'wrong_password' } } }

      before { post api_v1_tokens_url, params: params, as: :json }

      it 'returns a failing response' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
