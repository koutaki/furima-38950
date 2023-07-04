require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")        
      end

      it 'cityが全角（漢字・ひらがな・カタカナ）文字以外を含む場合は保存できないこと' do
        @order_address.city = 'Tokyo123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('City は全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end

      it 'house_numberが半角英数字以外の文字を含む場合は保存できないこと' do
        @order_address.house_number = '１２３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('House number は半角英数字を使用してください')
      end

      it 'building_nameに半角文字が含まれる場合は保存できないこと' do
        @order_address.building_name = '1A号室'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Building name は全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end

      it 'phone_numberに半角文字が含まれる場合は保存できないこと' do
        @order_address.phone_number = '0000abcd'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数値で入力してください')
      end
      
    end
  end
end  
