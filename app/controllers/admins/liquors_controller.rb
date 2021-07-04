class Admins::LiquorsController < ApplicationController


  def index #お酒の一覧を表示
   @liquors = Liquor.all.page(params[:page]).per(10)
  end

  def new #お酒新規登録画面を表示
   @liquor = Liquor.new
  end

  def create #お酒を新規登録
   @liquor = Liquor.new(liquor_params)
   if @liquor.save
     redirect_to admin_liquors_paht(@liquor)
   else
     render :new
   end
  end

  def show #お酒の詳細画面を表示
   @liquor = Liquor.find(params[:id])
  end

  def edit #お酒の編集画面を表示
   @liquor = Liquor.find(params[:id])
  end

  def update #お酒の編集を更新
   @liquor = Liquor.find(params[:id])
   if @liquor.update(liquor_params)
     redirect_to admin_liquors_paht
   else
     render :edit
   end
  end

  private
  def liquor_params
    params.require(:liquor).permit(:name, :detail, :image, :genre_id )
  end
end
