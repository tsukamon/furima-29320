class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @item = Item.all.order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
