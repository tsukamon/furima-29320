require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目が正しく存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name Full-width characters')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
    end
    it 'family_name_katakanaが空では登録できない' do
      @user.family_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana can't be blank", 'Family name katakana Full-width katakana characters')
    end
    it 'first_name_katakanaが空では登録できない' do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank", 'First name katakana Full-width katakana characters')
    end
    it '生年月日が空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'family_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.family_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'family_name_katakanaは全角（カタカナ）で入力させること' do
      @user.family_name_katakana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name katakana Full-width katakana characters')
    end
    it 'first_name_katakanaは全角（カタカナ）で入力させること' do
      @user.first_name_katakana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name katakana Full-width katakana characters')
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordはパスワードは半角英数字混合でなければ登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@がないと登録出来ない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end
