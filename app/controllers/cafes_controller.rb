class CafesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def own
    @cafes = current_user.cafes
  end

  def index
    @cafes = Cafe.where("name LIKE ? OR description LIKE ? OR address LIKE ?",
     "%#{params[:keyword]}%",
     "%#{params[:keyword]}%",
     "%#{params[:keyword]}%")
  end

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = current_user.cafes.new(cafe_params)

    if @cafe.save
      redirect_to cafes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
    @cafe = current_user.cafes.find(params[:id])
  end

  def update
    @cafe = current_user.cafes.find(params[:id])

    if @cafe.update(cafe_params)
      redirect_to cafe_path(@cafe)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cafe = current_user.cafes.find(params[:id])
    @cafe.destroy

    redirect_to "/cafes", notice: "削除しました", status: :see_other
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :description, :price, :address, :wifi, :power_outlet, :business_hours)
  end
end