class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!


  def index #会員一覧を表示
   @users = User.all.page(params[:page]).per(10)
  end

  def show #会員の詳細画面を表示
   @user = User.find(params[:id])
  end

  def edit #会員の編集画面を表示
   @user = User.find(params[:id])
  end

  def update #会員の編集を更新
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "編集されました"
     redirect_to admins_user_path(@user)
   else
     redirect_back(fallback_location: root_path)
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :user_status, :create_at)
  end
end
