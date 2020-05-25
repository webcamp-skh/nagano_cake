class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!

	def new
		@item = Item.new
		@i = Item.ransack(params[:q])
	end

	def index
  	    @items = Item.all
	end


	def show
		@item = Item.find(params[:id])
		@genre = @item.genre
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
        @item.save
        redirect_to admin_items_path
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to admin_item_path(@item)
	end

	def search
		@i = Item.ransack(params[:q])
		@items = @i.result
	end

	def set_search
		@i = Item.ransack(params[:q])
		@items = @i.result
	end


	private
	def item_params
	params.require(:item).permit(:name, :description, :image, :status, :price, :genre_id)
	end

end
