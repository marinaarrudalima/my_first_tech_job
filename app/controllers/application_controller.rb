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
    # se o current_user NÃO for nil (.:for válido) e o request NÃO for do tipo get: continue o método
    return unless current_user && request.get?

    path = request.path
    # se o current user for role_candidate e candidate estiver blank o path deve ser 'new_candidate_path'
    path = new_candidate_path if current_user.role_candidate? && current_user.candidate.blank?
    path = new_company_path if current_user.role_company? && current_user.company.blank?

     # se o current user for role_candidate e candidate estiver blank o path deve ser 'new_candidate_path'
    redirect_to path unless path.nil? || path == request.path
  end
end
