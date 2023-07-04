class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif @item.sold_out?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
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
