class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.includes(:resort)
    @booking_data = @bookings.map do |booking|
      { booking:, resort: booking.resort }
    end

    render json: @booking_data
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: { message: 'booking created', id: @booking.id }, status: :created
    else
      render json: { error: 'Unable to create booking' }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find_by_id(params[:id])
    if @booking.destroy
      render json: { message: 'Booking removed sucessfully' }, status: :ok
    else
      render json: { message: "Sorry, couldn't remove booking" }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking)
      .permit(:start_date, :end_date, :address)
      .with_defaults(user_id: current_user.id)
  end
end
