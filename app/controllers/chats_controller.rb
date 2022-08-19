class ChatsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @chat = Chat.new
    @chats = Chat.where(order: @order.id)
  end

  def create
    @chat = Chat.create!(chat_params)
    @order = Order.find(params[:id])
    if @chat.save
      flash[:success] = "メッセージを送信しました"
      redirect_to request.referer
      # リロード
    else
      flash[:error] = "メッセージの送信に失敗しました"
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :order_id, :user_id)
  end
end
