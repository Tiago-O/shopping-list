class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.where("user_id = ?", current_user)
    @new_list = List.new
  end

  def show
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:alert] = 'you added a list!'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'add a list failed'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
