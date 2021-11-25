require 'json'
require 'open-uri'

class JamsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show destroy]
  before_action :find_jam, only: :show

  def index
    @jams = policy_scope(Jam)
    # @jams = Jam.geocoded
    @markers = @jams.geocoded.map do |jam|
      {
        lat: jam.latitude,
        lng: jam.longitude,
        info_window: render_to_string(partial: "info_window", locals: { jam: jam }),
        image_url: helpers.asset_url('marker.svg')
      }
    end
  end

  def show
    authorize @jam
    @instruments = instruments_list
    @booking = Booking.new
    @markers = [{
      lat: @jam.latitude,
      lng: @jam.longitude,
      info_window: render_to_string(partial: "info_window", locals: { jam: @jam }),
      image_url: helpers.asset_url('marker.svg')
    }]
  end

  def new
    @jam = Jam.new
    authorize @jam
  end

  def create
    @jam = Jam.new(jam_params)
    authorize @jam
    @jam.user = current_user
    # if !@jam.photo.attached?
    #   image = URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637856316/lke5m9c4f9cicunxvcuh.jpg")
    #   @jam.photo.attach(io: image, filename: "default.jpg", content_type: 'image/jpg')
    # end
    if @jam.save
      redirect_to jam_path(@jam)
    else
      render :new
    end
  end

  #  <%= if jam.session.photo.attached? do %>
  #       <%= f.input :photo, as: :file %>
  #     <% else %>
  #       <%= image = URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637856316/lke5m9c4f9cicunxvcuh.jpg")%>
  #       <%= jam.session.photo.attach(io: image, filename: "Jam#{i}.jpg", content_type: 'image/jpg')%>
  #     <%= end %>

  def destroy
    authorize @jam
  end

  private

  def jam_params
    params.require(:jam).permit(:location, :title, :description, :date, :photo)
  end

  def find_jam
    @jam = Jam.find(params[:id])
  end

  def instruments_list
    url = 'https://raw.githubusercontent.com/dariusk/corpora/master/data/music/instruments.json'
    instruments_serial = URI.open(url).read
    results = JSON.parse(instruments_serial)
    results["instruments"]
  end
end
