require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/Rails0409.png")
    end
    it '全ての項目が正しく存在すれば登録できること' do
      expect(@item).to be_valid
    end
    it '出品画像がない場合は保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がない場合は保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がない場合は保存できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it '価格がない場合は保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price Out of setting range")
    end
    it 'カテゴリーが選択されていないと保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category select")
    end
    it '商品の状態が選択されていないと保存できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status select")
    end
    it '配送料の負担が選択されていないと保存できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee select")
    end
    it '発送元の地域が選択されていないと保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture select")
    end
    it '発送までに日数が選択されていないと保存できない' do
      @item.arrival_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Arrival date select")
    end
    it '販売価格が9,999,999より大きいと保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '販売価格が300より大きいと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '販売価格は半角英数字でないと保存できない' do
      @item.price = 'aaa'
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
  end
end
