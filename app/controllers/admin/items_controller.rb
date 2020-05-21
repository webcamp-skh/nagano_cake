class Admin::ItemsController < ApplicationController

	def new
		@item = Item.new

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


	private
	def item_params
	params.require(:item).permit(:name, :description, :image, :status, :price, :genre_id)
	end

end
