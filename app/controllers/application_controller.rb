class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

<<<<<<< HEAD
=======
  	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
 
    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:admin])
		devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
    end
>>>>>>> 7e378a60a465631ea839b1636721eef303e60f5b
end
