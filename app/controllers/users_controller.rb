class UsersController < ApplicationController

	def show
		@users = User.all
		@user = User.find(params[:id])
			if @user != current_user
			redirect_to root_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def hide
		@user = User.find(params[:id])
		@user.update(status: false)
		reset_session
		flash[:alert]= "退会しました。"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
	end
end
