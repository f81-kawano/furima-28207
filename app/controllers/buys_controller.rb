class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
   
  def index
    @buy_address = BuyAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    else 
      render :index
    end

  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address)
          .permit(:postal_code, :prefecture_id, :city, :house_num, :building, :phone_num)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
