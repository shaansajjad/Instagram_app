class SearchesController < ApplicationController
	def new 
		@search = Search.new
	end

	def create
		@search = User.find_by_Username(params[:search][:keywords])
		redirect_to search_path(@search.id)
	end

	def show
		@search = User.find(params[:id])
	end
end
