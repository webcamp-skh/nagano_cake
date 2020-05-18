class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    cart_items = current_user.cart_items.pluck(:item_id) #カート内のitem_idを全て抽出
    @order_item = OrderItem.new
    @order_item.item_id = cart_items

    @order = Order.new
    #@order.billing_amount = @order.
    #@order.payment_method =
    if params[:address_id] == 0
      @order.ordered_postal_code = current_user.postal_code
      @order.ordered_address = current_user.address
      @order.ordered_receiver_name = "#{current_user.last_name}#{current_user.first_name}"
    elsif params[:address_id] == 1
      @address = current_user.address.find(params[:id])
      @order.ordered_postal_code = @address.postal_code
      @order.ordered_address = @address.address
      @order.ordered_receiver_name = @address.receiver_name
    elsif params[:address_id] == 2
      @address = current_user.addresses.new(address_params)
      @order.ordered_postal_code = @address.postal_code
      @order.ordered_address = @address.address
      @order.ordered_receiver_name = @address.receiver_name
    end
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :receiver_name)
  end

end
