class ProfilesController < ApplicationController
	
	def index
		@users = User.all
		@profiles = Profile.all
	end


	def show

	end
	

end
