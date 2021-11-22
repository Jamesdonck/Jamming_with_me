class JamsController < ApplicationController
  before_action :find_jam, only: %i[show]

  def index
    @jams = Jam.all
  end

  def show
  end

  private

  def find_jam
    @jam = Jam.find(params[:id])
  end
end
