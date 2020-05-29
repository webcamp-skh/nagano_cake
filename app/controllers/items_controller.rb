class ItemsController < ApplicationController

  def index
  	  @item = Item.new
      @genres = Genre.where(status: true)
      true_genres = @genres.pluck(:id)
  	  @items = Item.where(status: true, genre_id: true_genres).page(params[:page]).per(12)
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
