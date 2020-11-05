require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'expositionが空では登録できないこと' do
      @item.exposition = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Exposition can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'state_idが空では登録できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State must be other than 1')
    end

    it 'delivery_idが空では登録できないこと' do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery must be other than 1')
    end

    it 'area_idが空では登録できないこと' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it 'days_idが空では登録できないこと' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days must be other than 1')
    end

    it 'priceが300以下だと登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999以上だと登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが全角数字だと登録できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '画像がないと出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
