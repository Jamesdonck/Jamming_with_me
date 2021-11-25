class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    authorize @user
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
