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

  def edit #編集フォーム
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
