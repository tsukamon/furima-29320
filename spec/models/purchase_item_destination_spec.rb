require 'rails_helper'

RSpec.describe PurchaseItemDestination, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_item = FactoryBot.build(:purchase_item_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_item).to be_valid
    end
    it '建築物が空でも保存できること' do
      @purchase_item.building = nil
      expect(@purchase_item).to be_valid
    end
    it 'トークンが生成されていないと保存できない' do
      @purchase_item.token = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できない' do
      @purchase_item.post_code = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフン(-)がないと保存できない' do
      @purchase_item.post_code = '1234567'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Post code input correctly include hyphen(-)')
    end
    it '発送先の都道府県が選択されていないと保存できない' do
      @purchase_item.prefecture_id = 1
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Prefecture select')
    end
    it '発送先の市区町村が空だと保存できない' do
      @purchase_item.city = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("City can't be blank")
    end
    it '発送先の番地が空だと保存できない' do
      @purchase_item.address = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できない' do
      @purchase_item.phone_number = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end
    it '電話番号にハイフンが入っていると保存できない' do
      @purchase_item.phone_number = '090-2344-2345'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
