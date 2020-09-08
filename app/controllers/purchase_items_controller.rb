class PurchaseItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only: [:index, :create]
  before_action :move_to_index, only: :index

  
  def index
    if @item.purchase_item.blank?
      @purchase_item = PurchaseItemDestination.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_item = PurchaseItemDestination.new(purchase_item_params)
    if @purchase_item.valid?
      pay_item
      @purchase_item.save 
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_item_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id).merge(item_id: @item.id, price: @item.price)
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
     amount: purchase_item_params[:price],  
     card: purchase_item_params[:token],    
     currency:'jpy'                
   )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      return redirect_to root_path
    end
  end
end
