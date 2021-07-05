class Admins::HomesController < ApplicationController

  before_action :authenticate_admin!


  def top #管理者topページ(お酒一覧)
   @liquors = Liquor.all
  end
end
