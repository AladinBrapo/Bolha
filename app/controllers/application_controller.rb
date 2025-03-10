class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end  

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path # Redirects to `/admin`
    else
      root_path # Normal users go to the homepage
    end
  end
end
