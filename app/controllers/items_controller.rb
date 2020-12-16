class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
       render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :categoty_id, :status_id, :shipping_id, :prefecture, :shipping_date_id, :price, :user)
  end
end
