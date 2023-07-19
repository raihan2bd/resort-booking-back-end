class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: { message: 'booking created' }, status: :created
    else
      render json: { error: 'Unable to create booking' }, status: :unprocessable_entity
    end
  end

  def destroy
    # create delete method
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking)
      .permit(:start_date, :end_date, :address)
      .with_defaults(user_id: current_user.id)
  end
end
