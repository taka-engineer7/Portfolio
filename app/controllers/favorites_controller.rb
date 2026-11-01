class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @favorite = Favorite.new(cafe_id: params[:cafe_id], user_id: current_user.id)

    if @favorite.save
      redirect_to cafe_path(params[:cafe_id])
    end
  end

  def index
    @favorite_cafes = current_user.favorite_cafes
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    cafe_id = @favorite.cafe_id
    @favorite.destroy

    redirect_to favorites_path, notice: "登録解除しました", status: :see_other
  end
end
