class BookingsController < ApplicationController

  def index
    booking = Booking.all
  end

  private

  def booking_params
    params.require(:booking)
    .permit(:start_date, :end_date, :address)
  end
end
