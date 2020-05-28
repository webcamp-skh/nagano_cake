class HomeController < ApplicationController
  def top
    @genres = Genre.where(status: true)
    @item1 = Item.first
    @item2 = Item.second
    @item3 = Item.third
    @item4 = Item.fourth
  end

  def about
  end
end
