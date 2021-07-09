class Users::UsersController < ApplicationController

  before_action :authenticate_user!


  def show #マイページ(詳細画面)の表示
   @user = current_user
   # @liquors = @user.liquors
   @liquor = Liquor.new
   @liquor_comment = LiquorComment.new
  end

  def edit #会員情報の編集画面を表示
   @user = current_user
  end

  def update #会員の登録情報を更新
   @user = current_user
   if @user.update(user_params)
     flash[:notice] = "変更内容を保存しました"
     redirect_to users_users_path
   else
     @user = user
     flash[:alert] = "正しく入力して下さい"
     render :edit
   end
  end

  def withdraw #退会確認画面
  end

  def destroy #退会実行
   user = current_user
   user.update(user_status: false)
   reset_session
   flash[:notice] = "ありがとうございます。またのご利用をお待ちしております"
   redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :mail)
  end

end
