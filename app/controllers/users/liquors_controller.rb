class Users::LiquorsController < ApplicationController

  def index #お酒の一覧を表示
   @liquors = Liquor.page(params[:page]).per(8)
   @liquor = Liquor.new
   @user = @user.liquor
   @liquor_comment = LiquorComment.new
  end

  def new #お酒の新規投稿画面
    @liquor = Liquor.new
  end

  def show #お酒の詳細画面を表示
    @liquor = Liquor.find(params[:id])
    @user = User.find(params[:id])
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



  def search #お酒のジャンル検索
  end

  private
  def liquor_params
    params.require(:liquor).permit(:neme, :detail, :image, :rate, :comment)
  end
end
