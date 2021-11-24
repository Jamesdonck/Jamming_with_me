class JamsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show destroy]
  before_action :find_jam, only: :show

  def index
    @jams = policy_scope(Jam)
    @jams = Jam.geocoded
    @markers = @jams.geocoded.map do |jam|
      {
        lat: jam.latitude,
        lng: jam.longitude,
        info_window: render_to_string(partial: "info_window", locals: { jam: jam }),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    authorize @jam
  end

  def new
    @jam = Jam.new
    authorize @jam
  end

  def create
    @jam = Jam.new(jam_params)
    authorize @jam
    @jam.user = current_user
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
    params.require(:jam).permit(:location, :title, :description, :date)
  end

  def find_jam
    @jam = Jam.find(params[:id])
  end
end
