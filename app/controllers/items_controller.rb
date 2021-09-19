class ItemsController < ApplicationController

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
      redirect_back(fallback_location: lists_path)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @item.list
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :list_id)
  end
end
