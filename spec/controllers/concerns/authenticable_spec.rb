# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authenticable do
  before do
    fake_class = Class.new(ApplicationController) do
      include Authenticable
      attr_accessor :request

      def initialize
        mock_request = Struct.new(:headers)
        self.request = mock_request.new({})
      end
    end
    stub_const('FakeController', fake_class)
  end

  let(:fake_controller) { FakeController.new }

  describe '#current_user' do
    let!(:user) { create(:user) }

    context 'when Authorization token is valid' do
      before do
        fake_controller.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id)
      end

      it 'get user from Authorization token' do
        expect(fake_controller.current_user.id).to eq(user.id)
      end
    end

    context 'when Authorization token is invalid' do
      it 'current user should be nil' do
        expect(fake_controller.current_user).to be_nil
      end
    end
  end

  describe '#check_auth' do
    context 'when Authorization token is send' do
      let(:user) { create(:user) }

      it 'won\'t raise error when Authorization is valid' do
        fake_controller.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id)

        expect(fake_controller.check_auth).to include(:user_id)
      end

      it 'will return head unauthorized when invalid' do
        fake_controller.request.headers['Authorization'] = 'wrong token'
        allow(fake_controller).to receive(:head).with(:unauthorized)

        expect { fake_controller.check_auth }.not_to raise_error
      end
    end

    context 'when Authorization token is not send' do
      it 'will return nil' do
        expect(fake_controller.check_auth).to be_nil
      end
    end
  end

  describe '#check_login' do
    context 'when Authorization token is valid' do
      let(:user) { create(:user) }

      before do
        fake_controller.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id)
      end

      it 'will not call head forbidden' do
        expect(fake_controller.check_login).not_to be_nil
      end
    end

    context 'when Authorization token is invalid' do
      it 'will call head forbidden' do
        allow(fake_controller).to receive(:head).with(:forbidden)
        expect(fake_controller.check_login).to be_nil
      end
    end
  end
end
