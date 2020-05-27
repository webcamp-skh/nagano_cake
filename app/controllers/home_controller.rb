class HomeController < ApplicationController
  def top
    @genres = Genre.where(status: true)
    @item1 = Item.find(4)
    @item2 = Item.find(5)
    @item3 = Item.find(6)
    @item4 = Item.find(8)
  end

  def about
  end
end
