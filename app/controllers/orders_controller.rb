class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_item, only: [:index, :create]
  

  def index
    @order_address = OrderAddress.new
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    #binding.pry学習の記録のために残す
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:prefecture_id, :postal_code, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    #binding.pry学習の記録のために残す
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,   
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
