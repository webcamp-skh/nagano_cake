class ItemsController < ApplicationController

  def index
  	  @item = Item.new
  	  @items = Item.all
  end

  def show
  	  @item = Item.find(params[:id])
      @cart_item =CartItem.new
  end

  def create
      @item = Item.new(item_params)
      @item.save
      redirect_to @item
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :description, :image_id, :status, :price)
  end

end
