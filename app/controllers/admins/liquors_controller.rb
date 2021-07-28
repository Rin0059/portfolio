class Admins::LiquorsController < ApplicationController

before_action :authenticate_admin!

  def index #お酒の一覧を表示
   @liquors = Liquor.all.page(params[:page]).per(10)
  end

  def new #お酒新規登録画面を表示
   @liquor = Liquor.new
  end

  def create #お酒を新規登録
   @liquor = Liquor.new(liquor_params)
   @liquor.save
   redirect_to admins_liquors_path(@liquor)
  end

  def show #お酒の詳細画面を表示
   @liquor = Liquor.find(params[:id])
   @user = @liquor.user
  end

  def edit #お酒の編集画面を表示
   @liquor = Liquor.find(params[:id])
  end

  def update #お酒の編集を更新
   @liquor = Liquor.find(params[:id])
   if @liquor.update(liquor_params)
     redirect_to admins_liquors_path
   else
     render :edit
   end
  end

  def destroy #お酒の削除
    @liquor = Liquor.find(params[:id])
    @liquor.destroy
    redirect_to admins_liquors_path
  end


  private
  def liquor_params
    params.require(:liquor).permit(:name, :detail, :image, :genre_id)
  end
end
