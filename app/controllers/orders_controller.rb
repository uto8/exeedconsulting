class OrdersController < ApplicationController
  before_action :autheniticate_user, {only: [:new, :create, :index]}
  # before_action :order_user, {only: [:edit]}

  def new
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.new(params.require(:order).permit(
      :buyer_id, :seller_id, :item_id
    ))
    # @item = Item.find(params[:id])
    if @order.save!
      flash[:success] = "購入しました"
      @order.item.update!(is_sold: true)
      redirect_to chat_path(@order.item)
    else
      flash[:error] = "購入に失敗しました"
      redirect_to root_path
    end
  end

  def index
    @orders = Order.where(buyer_id: current_user.id)
  end

  private
  def order_params
    params.require(:order).permit(
      :buyer_id, :seller_id, :item_id
    )
  end

  def order_user
    @orders = current_user.orders
    @order = @orders.find_by(id: params[:id])
    flash[:error]="アカウントが違います"
    redirect_to root_path unless @order
  end

end
