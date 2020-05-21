class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
	    case resource
	    when User
	      root_path
	    when Admin
	      admin_root_path
	    end
 	 end

	def after_sign_out_path_for(resource)
		if resource == :admin
		    new_admin_session_path
		else
		    root_path
		end
	 end

	private
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email])
	end
end
