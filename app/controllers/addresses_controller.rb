class AddressesController < ApplicationController

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
			render 'index'
		end
	end

	def edit
		@user = current_user
		@address = Address.new(address_params)
	end

	def update
		
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
end
