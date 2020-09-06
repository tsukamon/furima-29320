class PurchaseItemsController < ApplicationController
  # before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
  end

  private

  # def item_params
  #   params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :arrival_date_id, :price, :image).merge(user_id: current_user.id)
  # end

end
