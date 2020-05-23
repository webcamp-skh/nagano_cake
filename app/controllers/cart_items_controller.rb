class CartItemsController < ApplicationController

  def index
      @cart_items = current_user.cart_items.all
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      items = current_user.cart_items.pluck(:item_id)
      having_cart_items = CartItem.find_by(user_id: current_user.id, item_id: items)
      if 
        @cart_item.user_id = current_user.id
        @cart_item.save
      else
        having_cart_item.update(item_count: having_cart_item.item_count + @cart_item.item_count)
      end
      redirect_to cart_items_path
  end

  def destroy
      @cart_item = CartItem.find(params[:id])
      @cart_item.destroy
      redirect_to cart_items_path
  end

  def all_destroy
      current_user.cart_items.destroy_all
      redirect_to cart_items_path
  end

  def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.update(cart_item_params)
      redirect_to cart_items_path
  end

  private
  def cart_item_params
  	  params.require(:cart_item).permit(:item_count, :item_id)
  end

end
