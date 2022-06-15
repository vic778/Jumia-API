class ApplicationController < ActionController::Base
    respond_to :json, :html

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end
