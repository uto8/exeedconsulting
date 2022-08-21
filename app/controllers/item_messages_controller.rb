class ItemMessagesController < ApplicationController
  def create
    @item_message = ItemMessage.new(item_messages_params)
    if @item_message.save
      flash[:success] = "メッセージを送信しました"
    else
      flash[:error] = "メッセージの送信に失敗しました"
      # redirect_to item_path(@item)
    end
  end

  private
  def item_messages_params
    params.require(:item_message).permit(:message, :item_id, :user_id)
  end
end
