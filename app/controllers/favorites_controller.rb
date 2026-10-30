class FavoritesController < ApplicationController
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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to cafe_path(@favorite.cafe_id), notice: "登録解除しました", status: :see_other
  end
end
