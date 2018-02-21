class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
 
    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:admin])
		devise_parameter_sanitizer.permit(:account_update, keys: [:admin])


		added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :prefectures, :phone_number, :address_city, :address_building]

		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs


    end
end
