class AddressesController < ApplicationController
	before_action :baria_user

	def index
		@user = current_user
		@addresses = @user.addresses
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			redirect_to user_addresses_path(current_user.id)
		else
			@addresses = @user.addresses
			render 'index'
		end
	end

	def edit
		@user = current_user
		@address = current_user.addresses.find_by(id: params[:id])
	end

	def update
		@address = current_user.addresses.find_by(id: params[:id])
		if @address.update(address_params)
			redirect_to user_addresses_path
		else
			@user = User.find(params[:user_id])
			render 'edit'
		end
	end

	def destroy
		@address = current_user.addresses.find_by(id: params[:id])
		@address.destroy
		redirect_to user_addresses_path
	end

	private
	def address_params
		params.require(:address).permit(:postal_code, :address, :receiver_name)
	end

	def baria_user
		@user= User.find(params[:user_id])
		if @user != current_user
			flash[:alert]= "不正なアクセスです"
			redirect_to root_path
		end
	end
end
