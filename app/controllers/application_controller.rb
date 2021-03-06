class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_deleted])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:is_deleted])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end
end
