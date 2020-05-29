class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
	before_action :item_search

	def new
		@item = Item.new
		@i = Item.ransack(params[:q])
	end

	def index
		@items = Item.page(params[:page]).reverse_order
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
    if @item.save
    	flash[:notice] = "新しく商品を追加しました。"
    	redirect_to admin_items_path
    else
    	render 'new'
    end
	end

	def update
		@item = Item.find(params[:id])
		@genre = @item.genre
		if @item.update(item_params)
			flash[:notice] = "商品情報を更新しました。"
			redirect_to admin_item_path(@item)
		else
			render 'edit'
		end
	end

	def search
		@i = Item.ransack(params[:q])
		@items = @i.result.page(params[:page]).reverse_order
	end

	def item_search
		@i = Item.ransack(params[:q])
		@items = @i.result
	end


	private
	def item_params
	params.require(:item).permit(:name, :description, :image, :status, :price, :genre_id)
	end

end
