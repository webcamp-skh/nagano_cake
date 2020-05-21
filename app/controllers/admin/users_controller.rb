class Admin::UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :status)
	end
end
