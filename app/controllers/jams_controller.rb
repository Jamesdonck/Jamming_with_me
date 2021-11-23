class JamsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show destroy]
  before_action :find_jam, only: :show

  def index
    @jams = policy_scope(Jam)
  end

  def show
    authorize @jam
  end

  def new
    @jam = Jam.new
    authorize @jam
  end

  def create
    redirect_to jams_path
  end

  def destroy
    authorize @jam
  end

  private

  def find_jam
    @jam = Jam.find(params[:id])
  end
end
