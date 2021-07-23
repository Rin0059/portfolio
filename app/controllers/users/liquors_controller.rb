class Users::LiquorsController < ApplicationController

  def index #お酒の一覧を表示
   if params[:genre_id]
      # ganreのデータベースのテーブルから一致するidを取得
     @liquors = Liquor.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
   else
      # お酒すべてを取得
     @liquors = Liquor.all.page(params[:page]).per(8)
   end
  end


  def new #お酒の新規投稿画面
    @liquor = Liquor.new
  end

  def show #お酒の詳細画面を表示
    @liquor = Liquor.find(params[:id])
    @user = @liquor.user
    @liquor_comment = LiquorComment.new
  end


  def create #お酒の口コミを作成
    @liquor = Liquor.new(liquor_params)
    @liquor.user_id = current_user.id
    if @liquor.save
      redirect_to users_liquors_path(@liquor.id)
    else
      @liquors = Liquor.all
      @user = current_user
      render :index
    end
  end


  def edit #お酒の編集画面を表示
    @liquor = Liquor.find(params[:id])
    if @liquor.user == current_user
      render :edit
    else
      redirect_to users_liquors_path
    end
  end


  def update #お酒の編集を更新
   @liquor = Liquor.find(params[:id])
   if @liquor.update(liquor_params)
     redirect_to users_liquors_path
   else
     render :edit
   end
  end


  def destroy #お酒の削除
    @liquor = Liquor.find(params[:id])
    @liquor.destroy
    redirect_to users_liquors_path
  end


  def search #お酒のジャンル検索
  end

  private
  def liquor_params
    params.require(:liquor).permit(:name, :detail, :image, :rate, :comment, :genre_id)
  end
end
