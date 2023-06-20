class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_to, only: [:edit, :update]

  def index
    
    @items = Item.order("created_at DESC")
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path
    else
      
      render 'new'
    end
  end

  def show
    
  end

  def edit
    render :edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品が正常に更新されました。'
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def redirect_to
    return redirect_to root_path if current_user.id != @item.user.id
  end


  def item_params
    params.require(:item).permit(:name, :price, :item_condition_id, :introduction, :category_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image)
  end

end
