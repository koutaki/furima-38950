require 'rails_helper'

RSpec.describe Iteme, type: :model do
  before do
    @iteme = FactoryBot.build(:iteme, user: FactoryBot.create(:user))
  end

  describe '新規商品出品登録' do
    context '新規商品出品登録できるとき' do
      it 'nameとprice、item_condition_idとintroductionとcategory_idとshipping_cost_idとprefecture_idとshipping_day_idとimageが存在すれば登録できる' do
        expect(@iteme).to be_valid
      end
    end

    context '新規商品出品登録できないとき' do
      it 'nameが空では登録できない' do
        @iteme.name = ''
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空では登録できない' do
        @iteme.price = nil
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数値でないと登録できない' do
        @iteme.price = '３００'
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で半角数値入力してください')
      end

      it 'priceが300円以上9999999円以下でないと登録できない' do
        @iteme.price = 150
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include('Price は¥300〜¥9,999,999の間で半角数値入力してください')
      end

      it 'item_condition_idが1では登録できない' do
        @iteme.item_condition_id = 1
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Item condition can't be blank")
      end

      it 'prefecture_idが1では登録できない' do
        @iteme.prefecture_id = 1
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'introductionが空では登録できない' do
        @iteme.introduction = ''
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが1では登録できない' do
        @iteme.category_id = 1
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Category can't be blank")
      end

      it 'shipping_cost_idが1では登録できない' do
        @iteme.shipping_cost_id = 1
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'shipping_day_idが1では登録できない' do
        @iteme.shipping_day_id = 1
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'imageが空では登録できない' do
        @iteme.image = nil
        @iteme.valid?
        expect(@iteme.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end