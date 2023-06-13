class ItemesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @itemes = Iteme.order("created_at DESC")
  end

  def new
    @iteme = Iteme.new
  end

  def create
    @iteme = current_user.itemes.build(iteme_params)
    if @iteme.save
      redirect_to itemes_path
    else
      
      render 'new'
    end
  end

  private
  def iteme_params
    params.require(:iteme).permit(:name, :price, :item_condition_id, :introduction, :category_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image)
  end

end
