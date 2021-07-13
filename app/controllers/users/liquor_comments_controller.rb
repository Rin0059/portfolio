class Users::LiquorCommentsController < ApplicationController

  def create #口コミの新規投稿する
   @liquor_comment = LiquorComment.find(params[:liquor_comment_id])
   @comment = current_user.liquor_comments.new(users_liquor_liquor_comments_path_params)
   @comment.liquor_id = @liquor_comment.id
   @comment.save
   redirect_to liquor_path(@liquor)
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
