class ProfilesController < ApplicationController
  def show
    @users = user.find(params[:id])
  end

  def index
    @users = user.all
  end
end
