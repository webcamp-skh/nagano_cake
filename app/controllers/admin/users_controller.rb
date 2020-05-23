class Admin::UsersController < ApplicationController
	# before_action :baria_admin

	def index
		@users = User.page(params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to admin_users_path
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :status)
	end

	def baria_admin
		if Admin != current_user
			flash[:alert] = "不正なアクセスです"
			redirect_to root_path
		end
	end
end

