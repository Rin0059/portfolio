class Users::LiquorCommentsController < ApplicationController

  def create #口コミの新規投稿する
   @liquor_comment = Liquor.find(params[:liquor_id])
   @comment = current_user.liquor_comments.new(comment: params[:comment])
   @comment.liquor_id = @liquor_comment.id
   @comment.save
   redirect_to request.referer
  end


  def destroy #口コミを削除する
   LiquorComment.find_by(id: params[:id], liquor_id: params[:liquor_id]).destroy
   redirect_to request.referer
  end

end
