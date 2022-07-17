class StoriesController < ApplicationController
  def index
    @items = Item.where(item_type: 'story').limit(10).order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end
end
