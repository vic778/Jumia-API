class PermissionsController < ApplicationController
  before_action :authenticate_user

  def auth_header
    request.headers['Authorization']
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload = JWT.decode(token, 'vicSecret', true, algorithm: 'HS256').first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render json: { error: "Unauthorized access" }, status: :unauthorized
      end
    end
  end

  def authenticate_user!(_options = {})
    render json: { loggedIn: false, result: [], message: 'Please log in to continue' } unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  rescue StandardError
    head :unauthorized
  end

  def signed_in?
    @current_user_id.present?
  end
end
