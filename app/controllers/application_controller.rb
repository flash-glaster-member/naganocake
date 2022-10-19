class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up)
   end

   def after_sign_up_path_for(resource)
      customers_path
   end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
  end
end
