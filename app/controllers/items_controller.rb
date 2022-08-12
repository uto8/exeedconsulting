class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = "アイテムを作成しました"
      redirect_to item_path(@item)
    else
      flash[:error] = "アイテムの作成に失敗しました"
      render 'new'
    end
  end

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :description, :user_id, :is_sold, :item_status, :delivery_fee, :delivery_day
    )
  end
end
