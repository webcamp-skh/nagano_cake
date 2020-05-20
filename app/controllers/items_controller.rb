class ItemsController < ApplicationController

  def index
  	  @items = Item.all
      @item = Item.new
  end

  def show
  	  @item = Item.find(params[:id])
      @cart_item =CartItem.new

  end

  def create
      @item = Item.new(item_params)
      @item.save
      redirect_to items_path
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :description, :image, :status, :price)
  end

end
