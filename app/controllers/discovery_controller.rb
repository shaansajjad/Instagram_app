class DiscoveryController < ApplicationController

	def index
		@users = User.all
	end

	def search 
		@users = User.by_Username(params[:query])

		respond_to do |format|
			format.js
		end
	end
end
