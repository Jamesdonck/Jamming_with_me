class JamsController < ApplicationController
  before_action :find_jam, only: %i[show]
  before_action :authenticate_user!

  def index
    @jams = policy_scope(Jam)
  end

  def show
    authorize @jam
  end

  private

  def find_jam
    @jam = Jam.find(params[:id])
  end
end
