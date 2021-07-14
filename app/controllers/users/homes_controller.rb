class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @liquor = Liquor.find
  end

  def about
  end
end
