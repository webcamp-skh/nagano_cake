class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.page(params[:page]).reverse_order
		@u = User.ransack(params[:q])
		@users = @u.result.page(params[:page]).reverse_order
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "会員情報が更新されました。"
			redirect_to admin_user_path(@user)
		else
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :status)
	end

end

