class ItemsController < ApplicationController

  def index
  	  @item = Item.new
      @genres = Genre.where(status: true)
  	  @items = Item.where(status: true).where(genres_status: true).page(params[:page]).per(12)

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
