class ItemsController < ApplicationController
  before_action :autheniticate_user,  {only: [:new, :create, :edit, :delete_photo]}
  before_action :item_user, {only: [:edit]}

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

  def item_user
    @items = current_user.items
    @item = @items.find_by(id: params[:id])
    flash[:error]="アカウントが違います"
    redirect_to root_path unless @item
  end
end
