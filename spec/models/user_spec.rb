require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが129文字以上では登録できない' do
      end
    end
  end

  describe '本人情報確認新規登録' do
    context '新規登録できるとき' do
      it 'family_nameとfairst_nameとfamily_name_kanaとfairst_name_kanaとbirthdayが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'family_nameが空では登録できない' do
      end
      it 'fairst_nameが空では登録できない' do
      end
      it 'family_name_kanaが空では登録できない' do
      end
      it 'fairst_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end 
end