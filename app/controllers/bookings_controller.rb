class BookingsController < ApplicationController
  def new
    @instruments = Jam.all
    @user = current_user
    @booking = Booking.new
  end

  def create

  end

  private

  def booking_params
    params.require(:bookmark).permit(:instrument, :user_id, :jam_id)
  end
end
