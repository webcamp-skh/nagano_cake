class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = current_user.orders.new(order_params)
    @order.shipping = 800
    #sum_ordered_price =   ←商品小計
    #@order.billing_amount = @order.shipping + sum_ordered_price
    if params[:address_id] == 0
      @order.ordered_postal_code = current_user.postal_code
      @order.ordered_address = current_user.address
      @order.ordered_receiver_name = "#{current_user.last_name}#{current_user.first_name}"
    elsif params[:address_id] == 1
      @address = Address.find(params[:id])
      @order.ordered_postal_code = @address.postal_code
      @order.ordered_address = @address.address
      @order.ordered_receiver_name = @address.receiver_name
    elsif params[:address_id] == 2
      @address = current_user.addresses.new(address_params)
      @address.save
      @order.ordered_postal_code = @address.postal_code
      @order.ordered_address = @address.address
      @order.ordered_receiver_name = @address.receiver_name
    end

    #cart_items = current_user.cart_items.pluck(:item_id) #カート内のitem_idを全て抽出
    #@order.order_items = OrderItem.new
    #@order.order_items.item_id = cart_items
    #@order_items = OrderItem.all

  end

  def create
    order = Order.new(order_params)
    order.save


    current_user.cart_items.destroy_all
    redirect_to 'thanks'
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(
      :user_id, :payment_method, :billing_amount, :ordered_postal_code, :ordered_address, :ordered_receiver_name, 
      order_items_attributes: [:item_id, :item_count, :ordered_price])
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :receiver_name)
  end

end
