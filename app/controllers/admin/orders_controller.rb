class Admin::OrdersController < ApplicationController
	def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
    #where(created_at: 1.day.ago.all_day)
	end

  def index
    @orders = Order.all
  end

  def user_index
    @orders = Order.where(user_id: params[:user_id])
    render 'index'
  end

  def today_index
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
    render 'index'
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order.order_items.update(making_status: "製作待ち")
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end


