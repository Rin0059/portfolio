class Admins::GenresController < ApplicationController


  def index #ジャンル一覧・追加を表示
   @genre = Genre.new
   @genres = Genre.all
  end

  def create #ジャンルを追加
   @genre = Genre.new(genre_params)
   if @genre.save
     redirect_to admins_genres_path
     flash[:notice] = "追加されました"
   else
     @genre = Genre.all
     render :index
   end
  end

  def edit #ジャンルの編集画面を表示
  @genre = Genre.find(params[:id])
  end

  def update #ジャンルの編集を更新
   @genre = Genre.find(params[:id])
   if @genre.update(genre_params)
     redirect_to admins_genres_path
     flash[:notice] = "ジャンル名を変更しました"
   else
     @genre = Genre.find(params[:id])
     render :edit
   end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
