class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.making_status == "製作中"
      @order_item.order.update(order_status: "製作中")
    elsif @order_item.making_status == "製作完了"
      @order_item.order.update(order_status: "発送準備中")
    end
    redirect_to admin_order_path(@order_item.order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
