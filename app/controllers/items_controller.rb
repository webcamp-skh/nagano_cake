class ItemsController < ApplicationController

  def index
  	  @item = Item.new
  	  @items = Item.all
      @genres = Genre.where(status: true)
  end

  def show
  	  @item = Item.find(params[:id])
      @cart_item = CartItem.new
      @genres = Genre.where(status: true)
  end

  def search
      @genres = Genre.where(status: true)
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :description, :image_id, :status, :price,:genre_id)
  end

end
