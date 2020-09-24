# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Authenticable
  before_action :check_auth
end
