class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Bookmark.new(booking_params)
    @booking.user_id = current_user
    if @bookmark.save
      redirect_to jam_path(:jam_id)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:bookmark).permit(:instrument, :jam_id)
  end
end
