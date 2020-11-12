require 'rails_helper'

RSpec.describe UserDomain, type: :model do
  describe '#create' do
    before do
      @user_domain = FactoryBot.build(:user_domain)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user_domain).to be_valid
    end

    it 'buildが空でも保存できること' do
      @user_domain.build = nil
      expect(@user_domain).to be_valid
    end

    it 'post_numberが空だと保存できないこと' do
      @user_domain.post_number = nil
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include("Post number can't be blank")
    end

    it 'townが空だと保存できないこと' do
      @user_domain.town = nil
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include("Town can't be blank")
    end

    it 'numberが空だと保存できないこと' do
      @user_domain.number = nil
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include("Number can't be blank")
    end

    it 'photo_numberが空だと保存できないこと' do
      @user_domain.photo_number = nil
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include("Photo number can't be blank")
    end

    it 'photo_numberが空だと保存できないこと' do
      @user_domain.prefecture_id = 1
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'post_numberはハイフンがないと保存できない' do
      @user_domain.post_number = '1234567'
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include('Post number is invalid')
    end

    it 'photo_numberはハイフンがあると保存できない' do
      @user_domain.photo_number = '0480-555-555'
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include('Photo number is invalid')
    end

    it 'tokenが空だと保存できない' do
      @user_domain.token = nil
      @user_domain.valid?
      expect(@user_domain.errors.full_messages).to include("Token can't be blank")
    end
  end
end
