class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    @order_items = OrderItem.where(order_id: @order_item.order_id)
    if @order_item.update(order_item_params)
      flash[:notice] = "製作ステータスが更新されました。"
      if @order_item.making_status == "製作中"
        @order_item.order.update(order_status: "製作中")
        flash[:success] = "注文ステータスが更新されました。"
      end
      if @order_items.count(making_status: "製作完了") == @order_items.count
        @order_item.order.update(order_status: "発送準備中")
        flash[:success] = "注文ステータスが更新されました。"
      end
    end
    redirect_to admin_order_path(@order_item.order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
