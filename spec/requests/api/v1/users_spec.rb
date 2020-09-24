# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Api::V1::User. As you add validations to Api::V1::User, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) { attributes_for(:user) }

  let(:invalid_attributes) { attributes_for(:user, name: nil, password: '1') }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) { {} }

  describe 'GET /index' do
    let!(:user) { create(:user) }
    it 'renders a successful response' do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user) }

    it 'renders a successful response' do
      get api_v1_user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post api_v1_users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new api/v1_user', :aggregate_failures do
        post api_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Api::V1::User' do
        expect do
          post api_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new api/v1_user', :aggregate_failures do
        post api_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:user) { create(:user) }
      let(:new_attributes) { { email: 'new.email@example.com' } }

      it 'updates the requested api/v1_user' do
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        expect(user.email).to eq(new_attributes[:email])
      end

      it 'renders a JSON response with the api/v1_user', :aggregate_failures do
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      let(:user) { create(:user) }

      it 'renders a JSON response with errors for the api/v1_user', :aggregate_failures do
        patch api_v1_user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:user) { create(:user) }

    it 'destroys the requested api/v1_user' do
      expect do
        delete api_v1_user_url(user), headers: valid_headers, as: :json
      end.to change(User, :count).by(-1)
    end
  end
end
