class ItemsController < ApplicationController

  def index
  	  @item = Item.new
  	  @items = Item.page(params[:page]).reverse_order
      @genres = Genre.where(status: true)

  end

  def show
  	  @item = Item.find(params[:id])
      @cart_item = CartItem.new
      @genres = Genre.where(status: true)
  end

  def commment
      @item = Item.find(params[:id])
      @comment = Comment.find(params[:id])
      @comments = Comment.new
  end


  def search
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :description, :image_id, :status, :price,:genre_id)
  end

end
