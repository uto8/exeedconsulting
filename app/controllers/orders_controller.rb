class OrdersController < ApplicationController
  before_action :autheniticate_user, {only: [:new, :create, :index]}
  # before_action :order_user, {only: [:edit]}

  def new
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    @item = Item.find(params[:id])
    if @order.save
      flash[:success] = "購入しました"
      redirect_to orders_path
    else
      flash[:error] = "購入に失敗しました"
      render 'show'
    end
  end

  def index
    @orders = Order.all
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
