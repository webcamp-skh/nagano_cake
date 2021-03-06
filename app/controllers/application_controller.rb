class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

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

	def set_search
		@q = Item.ransack(params[:q])
    	@items = @q.result.page(params[:page]).reverse_order
	end

	private
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email])
	end

end
