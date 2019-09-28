class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

private
  def after_sign_in_path_for(resource)
    if current_user.admin?
      secret_code_index_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    #permitted custom parameters to do CRUD operation
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:email, :password, :password_confirmation, :current_password) }
  end
end
