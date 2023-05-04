class ListsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create #新規投稿
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end
    
  def index #タイトル一覧
    @lists = List.all
  end

  def show #投稿一覧
    @list = List.find(params[:id])
  end

  def edit
  end
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
