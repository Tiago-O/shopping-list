class ItemsController < ApplicationController
  before_action :set_item, only: %i[destroy]

  def create
    @item = Item.new(item_params)
    @item.list = List.find(params[:list_id])
    if @item.save
      flash[:alert] = 'you added an item!'
      redirect_to @item.list
      # redirect_back(fallback_location: @list)
    else
      flash[:alert] = 'add an item failed'
      # redirect_to @item.list
      redirect_back(fallback_location: @item.list)
    end
  end

  def destroy
    @item.destroy
    redirect_to @item.list
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :list_id)
  end
end
