class OrdersController < ApplicationController
  def new
    @order = Order.new
    if params[:user][:user_address] == 0
      @order.ordered_postal_code = current_user.postal_code
      @order.ordered_address = current_user.address
      @order.ordered_receiver_name = "#{current_user.last_name}#{current_user.first_name}"
    elsif params[:user][:user_address] == 1

    elsif params[:user][:user_address] == 2

    end
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
