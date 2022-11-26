class PagesController < ApplicationController
  before_action :search

  def home
    @q = Item.ransack(params[:q])
    @items_results = @q.result(distinct: true)
  end

  def search
    @q = Item.ransack(params[:q])
  end
end
