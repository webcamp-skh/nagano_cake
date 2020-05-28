class CartItemsController < ApplicationController
  before_action :baria_user

  def index
      @cart_items = current_user.cart_items.all
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      items = current_user.cart_items.pluck(:item_id)
      if items.include?(@cart_item.item_id)
        having_cart_item = CartItem.find_by(user_id: current_user.id, item_id: @cart_item.item_id)
        having_cart_item.update(item_count: having_cart_item.item_count + @cart_item.item_count)
      else
        @cart_item.user_id = current_user.id
        @cart_item.save
        flash[:notice] = "商品をカートに追加しました。"
      end
      redirect_to cart_items_path
  end

  def destroy
      @cart_item = CartItem.find(params[:id])
      @cart_item.destroy
      flash[:alert] = "商品をカートから削除しました。"
      redirect_to cart_items_path
  end

  def all_destroy
      current_user.cart_items.destroy_all
      flash[:alert] = "カート内の商品を全て削除しました。"
      redirect_to cart_items_path
  end

  def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.update(cart_item_params)
      flash[:notice] = "商品の数量を変更しました。"
      redirect_to cart_items_path
  end

  private
  def cart_item_params
  	  params.require(:cart_item).permit(:item_count, :item_id)
  end

  def baria_user
    unless user_signed_in?
      flash[:alert]= "ログインしてください。"
      redirect_to new_user_session_path
    end
  end

end
