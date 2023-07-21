class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password role])
  end

  private

  def authenticate_user!
    unless user_signed_in?
      render json: { error: 'Unauthorized: You need to sign in or provide a valid token.' }, status: :unauthorized
    end
  end
end
