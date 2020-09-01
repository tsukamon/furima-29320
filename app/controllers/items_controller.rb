class ItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to  new_item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:arrival_date_id,:price).merge(user_id: current_user.id)
  end
end
