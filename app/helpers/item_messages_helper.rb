module ItemMessagesHelper
  def item_message(chat)
    if chat.user == current_user
      return "my_message"
    else
      return "your_message"
    end
  end
end
