class FavoritesController < ApplicationController
  def create
    @item_favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
    @item_favorite.save
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to item_path(params[:item_id])
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
