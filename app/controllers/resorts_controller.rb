class ResortsController < ApplicationController


  def index
    resorts = Resort.include(:user)
    render json: resorts
  end

  def show
    resort = Presort.includes(:user).find(params[:id])
    render json: packages
  end
end
