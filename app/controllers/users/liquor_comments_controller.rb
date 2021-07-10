class Users::LiquorCommentsController < ApplicationController

  def index #口コミ一覧
    @liquors = Liquor.page(params[:page]).per(10)
    @liquor_comment = LiquorComment.new
    @user = @user.liquor
  end

  def new
    @liquor_comment = LiquorComment.new
  end

  def show
    @liquor_comment = LiquorComment.find(params[:id])
  end

  def create #口コミの新規投稿する
   @liquor = Liquor.find(params[:liquor_id])
   @comment = current_user.liquor_comments.new(user_liquor_liquor_comments_path_params)
   @comment.liquor_id = @liquor.id
   @comment.save
   redirect_to liquor_path(@liquor)
  end

  def edit
    @liquor_comment = LiquorComment.find(params[:id])
  end

  def destroy #口コミを削除する
   LiquorComments.find_by([:id], params[:id], liquor_id: params[:liquor_id]).destroy
   redirect_to liquor_path(params[:liquor_id])
  end

  private
  def liquor_comment_params
    params.require(:liquor_comment).permit(:comment)
  end
end
