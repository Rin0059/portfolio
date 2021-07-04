class Users::LiquorsController < ApplicationController
  def index #お酒の一覧を表示
   @liquors = Liquor.page(params[:page]).per(8)
  end

  def show #お酒の詳細画面を表示
    @liquor = Liquor.find(params[:id])
  end

  def search #お酒のジャンル検索
  end

  private
  def liquor_params
    params.require(:liquor).permit(:neme, :detail, :image)
  end
end
