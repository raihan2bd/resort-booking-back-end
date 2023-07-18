class BookingsController < ApplicationController
  def index
    Booking.all
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: { message: 'booking created' }, status: :created
    else
      render json: { error: 'Unable to create booking' }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking)
      .permit(:start_date, :end_date, :address)
  end
end
