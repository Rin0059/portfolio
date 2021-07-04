class Admins::HomesController < ApplicationController

  before_action :authenticate_admin!


  def top #管理者topページ(口コミ履歴一覧)
  # path = Rails.application.routes.recognize_path(request.referer)

  #   if path[:controller] == "admins/users" && path[:action] == "show"
  #     @liquor_comment = LiquorComment.where(user_id: path[:id])
  #   else
  #     @liquor_comment = LiquorComment.all
  #   end
  end
end
