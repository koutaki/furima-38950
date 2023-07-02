require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user: @user, item: @item)
  end

  context '内容に問題ない場合' do
    it "user_id, item_id,tokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "user_id, item_id,tokenが空では保存ができないこと" do
      @order.user = nil
      @order.item = nil
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User must exist", "Item must exist","Token must exist")
    end
  end
end