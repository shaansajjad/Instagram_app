class DiscoveryController < ApplicationController
  def index
    @users = User.all
  end
end
