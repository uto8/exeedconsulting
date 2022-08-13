class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    # @item = Item.find(params[:id])
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

  def order_params
    params.require(:order).permit(
      :buyer_id, :seller_id, :item_id
    )
  end
end
