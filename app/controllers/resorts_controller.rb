class ResortsController < ApplicationController


  def index
    resorts = Resort.include(:user)
    render json: resorts
  end

  def show
    resort = Presort.includes(:user).find(params[:id])
    render json: package
  end

  private

  def resort_params
    params.require(:resort)
    .permit(:name, :location, :price, :guests_amount, :image_url)
end
