# frozen_string_literal: true

module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find_by(id: decoded[:user_id])
  end

  def check_auth
    header = request.headers['Authorization']
    return nil if header.nil?

    JsonWebToken.decode(header)
  rescue JWT::DecodeError
    head(:unauthorized)
  end

  def check_login
    current_user || head(:forbidden)
  end
end
