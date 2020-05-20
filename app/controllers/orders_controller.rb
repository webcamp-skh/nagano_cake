class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = current_user.orders.new
    @order.payment_method = params[:payment_method]
    @order.shipping = 800 #送料

    @item_total_price = 0 #商品合計金額(税込)
    current_user.cart_items.each do |cart_item|
      subtotal_price = cart_item.item.price * cart_item.item_count * 110 / 100 #小計(税込)
      @item_total_price += subtotal_price
    end
    @order.billing_amount = @item_total_price + @order.shipping #請求金額(税込)=商品合計金額+送料

    if params[:address_id] == "0"
      @order.ordered_postal_code = current_user.postal_code
      @order.ordered_address = current_user.address
      @order.ordered_receiver_name = "#{current_user.last_name}#{current_user.first_name}"
    elsif params[:address_id] == "1"
      @address = Address.find(params[:address_select])
      @order.ordered_postal_code = @address.postal_code
      @order.ordered_address = @address.address
      @order.ordered_receiver_name = @address.receiver_name
    elsif params[:address_id] == "2"
      @order.ordered_postal_code = params[:postal_code]
      @order.ordered_address = params[:address]
      @order.ordered_receiver_name = params[:receiver_name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_user.cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = @order.id
      order_item.item_count = cart_item.item_count
      order_item.ordered_price = cart_item.item.price * 110 / 100.0 #税込
      order_item.save
    end
    current_user.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_user.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items

    @item_total_price = 0 #商品合計金額(税込)
    @order_items.each do |order_item|
      subtotal_price = order_item.ordered_price * order_item.item_count #小計(税込)
      @item_total_price += subtotal_price
    end
  end

  private
  def order_params
    params.require(:order).permit(
      :user_id, :payment_method, :billing_amount, :ordered_postal_code, :ordered_address, :ordered_receiver_name)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :receiver_name)
  end

end
