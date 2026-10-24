class CafesController < ApplicationController
  def index
    @cafes = Cafe.all
  end

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = current_user.cafes.new(cafe_params)

    if @cafe.save
      redirect_to "/cafes"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
    @cafe = Cafe.find(params[:id])

    if @cafe.update(cafe_params)
      redirect_to "/cafes/#{@cafe.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cafe = Cafe.find(params[:id])
    @cafe.destroy

    redirect_to "/cafes", notice: "削除しました", status: :see_other
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :description, :price, :address, :wifi, :power_outlet, :business_hours)
  end
end