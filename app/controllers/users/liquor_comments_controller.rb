class Users::LiquorCommentsController < ApplicationController

  def create #口コミを投稿する
   @liquor = Liquor.find(params[:liquor_id])
   @comment = current_user.liquor_comments.new(liquor_comment_path_params)
   @comment.liquor_id = @liquor.id
   @comment.save
   redirect_to liquor_path(@liquor)
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
