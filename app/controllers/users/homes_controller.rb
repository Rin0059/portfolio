class Users::HomesController < ApplicationController
  def top
    @liquors = Liquor.limit(4).order('id DESC')
  end

  def about
  end
end
