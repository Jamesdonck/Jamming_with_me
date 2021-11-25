class BookingsController < ApplicationController
  def new
    @jam = Jam.find(params[:jam_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @jam = Jam.find(params[:jam_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.jam = @jam
    if @booking.save
      redirect_to jam_path(@jam)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:instrument)
  end
end
