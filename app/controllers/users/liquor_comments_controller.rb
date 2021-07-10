class Users::LiquorCommentsController < ApplicationController

  def index #口コミ一覧
    @liquors = Liquor.page(params[:page]).per(10)
    @liquor_comment = LiquorComment.new
    @user = @user.liquor_comment
  end

  def new #口コミ新規登録画面を表示
    @liquor_comment = LiquorComment.new
  end

  def show ##口コミの詳細画面を表示
    @liquor_comment = LiquorComment.find(params[:id])
  end

  def create #口コミの新規投稿する
   @liquor_comment = LiquorComment.find(params[:liquor_comment_id])
   @comment = current_user.liquor_comments.new(user_liquor_liquor_comments_path_params)
   @comment.liquor_id = @liquor_comment.id
   @comment.save
   redirect_to liquor_path(@liquor)
  end

  def edit #口コミの編集画面を表示
    @liquor_comment = LiquorComment.find(params[:id])
  end
  
  def update
    @liquor_comment = LiquorComment.find(params[:id])
   if @liquor_comment.update(liquor_comment_params)
     redirect_to users_liquor_liquor_comment_path
   else
     render :edit
   end
  end

  def destroy #口コミを削除する
   LiquorComments.find_by([:id], params[:id], liquor_comment_id: params[:liquor_comment_id]).destroy
   redirect_to users_liquor_liquor_comment_path(params[:liquor_comment_id])
  end

  private
  def liquor_comment_params
    params.require(:liquor_comment).permit(:comment)
  end
end
