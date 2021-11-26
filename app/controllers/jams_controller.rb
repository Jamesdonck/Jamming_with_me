require 'json'
require 'open-uri'

class JamsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show destroy]
  before_action :find_jam, only: :show

  def index
    if params[:search].nil? || params[:search][:lat].nil?
      redirect_to root_path, alert: "Sorry! Couldn't find the city..."
    end
    @city = params[:search][:city]
    @center_coordinates = [params[:search][:lat].to_f, params[:search][:lng].to_f]
    @jams = Jam.near(@center_coordinates, 50)
    @jams = policy_scope(@jams)
    @markers = @jams.geocoded.map { |jam| create_marker(jam) }
  end

  def show
    authorize @jam
    @instruments = instruments_list
    @booking = Booking.new
    @markers = [create_marker(@jam)]
    @center_coordinates = [@jam.latitude, @jam.longitude]
  end

  def new
    @jam = Jam.new
    authorize @jam
  end

  def create
    @jam = Jam.new(jam_params)
    authorize @jam
    @jam.user = current_user
    unless @jam.photo.attached?
      image = URI.open("https://res.cloudinary.com/gmrcp/image/upload/v1637888754/jammin/14635729448_ede72bb72c_b_uzvn7j.jpg")
      @jam.photo.attach(io: image, filename: "default.jpg", content_type: 'image/jpg')
    end
    if @jam.save
      redirect_to jam_path(@jam)
    else
      render :new
    end
  end

  def destroy
    authorize @jam
  end

  private

  def jam_params
    params.require(:jam).permit(:location, :title, :description, :date, :photo, :latitude, :longitude)
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

  def create_marker(jam)
    {
      lat: jam.latitude,
      lng: jam.longitude,
      image_url: helpers.asset_url('marker.svg'),
      id: jam.id
    }
  end
end
