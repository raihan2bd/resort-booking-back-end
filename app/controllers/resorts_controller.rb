class ResortsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :resort_params]
  load_and_authorize_resource

  def index
    @resorts = Resort.all
    render json: @resorts
  end

  def show
    @resort = Resort.includes(:user).find(params[:id])
    render json: @resort
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      render json: { message: 'Resort created', id: @resort.id }, status: :created
    else
      render json: { error: 'Unable to create resort' }, status: :unprocessable_entity
    end
  end

  def destroy
    @resort = Resort.find_by_id(params[:id])
    if @resort.destroy
      render json: { message: 'Resort removed sucessfully' }, status: :ok
    else
      render json: { message: "Sorry, couldn't remove resort" }, status: :unprocessable_entity
    end
  end

  private

  def resort_params
    params.require(:resort)
      .permit(:name, :description, :location, :price, :guests_amount, :image_url)
      .with_defaults(user_id: current_user.id)
  end
end