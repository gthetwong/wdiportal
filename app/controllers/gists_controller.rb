class GistsController < ApplicationController

	def index
		@gists = Gist.all
	end

	def new
		@gist = Gist.new
	end

	def create
		parameters = params.require(:gist).permit(:title, :url)
		gist = Gist.create(parameters)
		redirect_to gists_path
	end

	def edit
		id = params.require(:id)
		@gist = Gist.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:gist).permit(:title, :url)
		gist = Gist.find(id)
		gist.update(updates)
		redirect_to gists_path
	end

	def destroy
		id = params[:id]
		Gist.destroy(id)
		redirect_to gists_path
	end

end
