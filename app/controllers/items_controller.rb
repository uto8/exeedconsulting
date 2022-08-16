class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = "アイテムを作成しました"
      redirect_to item_path(@item)
      # 遷移先設定
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

  def delete_photo
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    flash[:success] = "画像を削除しました"
    redirect_back(fallback_location: root_path)
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :description, :user_id, :is_sold, :item_status, :delivery_fee, :delivery_day, images: []
    )
  end
end
