class ProfilesController < ApplicationController
  def index
    # @user = User.last
    @profiles = Profile.all
  end
  
  def show
    @user = User.find(params[:id])
  end
end
