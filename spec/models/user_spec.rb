require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfamily_nameとfairst_nameとfamily_name_kanaとfairst_name_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password は半角英数字混合で入力してください"
      end
      it 'パスワードが6文字以上でないと登録できない' do
        @user.password = 'pass'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
       
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
       
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
       
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end 
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
     
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name は全角（漢字・ひらがな・カタカナ）文字を使用してください"
      
      end

      it 'fairst_nameが空では登録できない' do
        @user.fairst_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Fairst name can't be blank"
      
      end
      it 'fairst_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.fairst_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include "Fairst name は全角（漢字・ひらがな・カタカナ）文字を使用してください"
       
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
       
      end
      it 'family_name_kanaが全角カタカナでないと登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include('は全角カタカナを使用してください')
      end
      
      it 'fairst_nameに全角（漢字・ひらがな・カタカナ）文字以外の文字を入力すると登録できない' do
        @user.fairst_name = 'a' 
        @user.valid?
        expect(@user.errors[:fairst_name]).to include"は全角（漢字・ひらがな・カタカナ）文字を使用してください"
      end

      it 'family_nameに全角（漢字・ひらがな・カタカナ）文字以外の文字を入力すると登録できない' do
        @user.family_name = 'a' 
        @user.valid?
        expect(@user.errors[:family_name]).to include"は全角（漢字・ひらがな・カタカナ）文字を使用してください"
      end

      it 'fairst_name_kanaに全角カタカナ以外の文字を入力すると登録できない' do
        @user.fairst_name_kana = 'たろう' 
        @user.valid?
        expect(@user.errors[:fairst_name_kana]).to include('は全角カタカナを使用してください')
      end

      it 'family_name_kanaに全角カタカナ以外の文字を入力すると登録できない' do
        @user.family_name_kana = 'やまだ' 
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include('は全角カタカナを使用してください')
      end

      it 'fairst_name_kanaが空では登録できない' do
        @user.fairst_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Fairst name kana can't be blank"
       
      end
      it 'fairst_name_kanaが全角カタカナでないと登録できない' do
        @user.fairst_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors[:fairst_name_kana]).to include('は全角カタカナを使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
     
      end
    end
  end
end