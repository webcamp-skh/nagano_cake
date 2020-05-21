class Admin::OrdersController < ApplicationController
	def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
    #where(created_at: 1.day.ago.all_day)
	end

  def index
  end

  def user_index
  end

  def today_index
  end

  def show
  end

  def update
  end
end
