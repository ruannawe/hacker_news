class StoriesController < ApplicationController
  def index
    @items = Item.where(item_type: :story).order(created_at: :desc).limit(10)
  end

  def show
    @item = Item.find(params[:id])
  end
end
