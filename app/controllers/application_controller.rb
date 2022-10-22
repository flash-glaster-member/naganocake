class ApplicationController < ActionController::Base

  before_action :authenticate_any!, except: [:top, :about,:index]



  before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :kana_first_name, :kana_last_name, :postcode, :address, :email, :password])
   end

   def after_sign_up_path_for(resource)
      customers_path
   end

   def authenticate_any!
  if admin_signed_in?
      true
  else
      authenticate_customer!
  end
end

   protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :kana_first_name, :kana_last_name, :postcode, :address, :email, :password])


  end
end

