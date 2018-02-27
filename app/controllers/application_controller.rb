class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
 
    def configure_permitted_parameters
		added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :prefectures, :phone_number, :address_city, :address_building]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs

    end

	def after_sign_in_path_for(resource)
		if current_user.admin_flag == true
			admin_root_path # ログイン後に遷移するpathを設定
		else
			items_path 
		end 
	end

	def after_sign_out_path_for(resource)
		items_path # ログアウト後に遷移するpathを設定
	end
end










