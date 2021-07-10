class Users::LiquorsController < ApplicationController

  def index #お酒の一覧を表示
   @liquors = Liquor.page(params[:page]).per(8)
   @liquor = Liquor.new
  # @user = @user.liquor
   @liquor_comment = LiquorComment.new
  end

  def show #お酒の詳細画面を表示
    @liquor = Liquor.find(params[:id])
    @user = User.find(params[:id])
    # @liquors = @user.liquors
  end

  def create #お酒の口コミを作成
    @liquor = Liquor.new(liquor_params)
    @liquor.user_id = current_user.id
    if @liquor.save
      redirect_to user_liquors_path(@liquor.id)
    else
      @liquor = Liquor.all
      @user = current_user
      render :index
    end
  end



  def search #お酒のジャンル検索
  end

  private
  def liquor_params
    params.require(:liquor).permit(:neme, :detail, :image)
  end
end
