class DiscoveryController < ApplicationController

  def index
    @users = User.all
    # @user = User.search(params[:search])
    # if params[:search]
    # @user = User.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}"])
    # else
    # projects = Project.find(:all)
    # end
  end

  def search
    @users = User.by_Username(params[:query])

    respond_to do |format|
      format.js
    end
  end
end
