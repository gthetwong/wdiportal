class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
	end

	def new
		@resource = Resource.new
	end

	def create
		parameters = params.require(:resource).permit(:title, :url, :description)
		resource = Resource.create(parameters)
		redirect_to resources_path
	end

	def edit
		id = params.require(:id)
		@resource = Resource.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:resource).permit(:title, :url, :description)
		resource = Resource.find(id)
		resource.update(updates)
		redirect_to resources_path
	end

	def destroy
		id = params[:id]
		Resource.destroy(id)
		redirect_to resources_path
	end

end
