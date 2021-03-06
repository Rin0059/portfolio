class Users::FavoritesController < ApplicationController

  def create #評価をする
    @liquor = Liquor.find(params[:liquor_id])
    favorite = current_user.favorites.new(liquor_id: @liquor.id)
    favorite.save
  end

  def destroy #評価を外す
    @liquor = Liquor.find(params[:liquor_id])
    favorite = current_user.favorites.find_by(liquor_id: @liquor.id)
    favorite.destroy
  end
end
