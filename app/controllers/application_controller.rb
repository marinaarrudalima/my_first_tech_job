class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :dispatch_user

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    # For additional in app/views/devise/registrations/edit.html.erb
  end


  def dispatch_user
    return unless current_user && request.get?
    path = request.path
    path = new_candidate_path if current_user.role_candidate? && current_user.candidate.blank?

    redirect_to path unless path.nil? || path == request.path
  end
end
