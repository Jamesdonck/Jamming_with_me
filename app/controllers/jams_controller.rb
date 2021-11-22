class JamsController < ApplicationController
  def index
    @jams = Jam.all
  end

  def show
  end
end
