class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
	end

	def new
		@resource = Resource.new
	end

	def create
		parameters = params.require(:resource).permit(:title, :url, :description)
		resource = current_user.resources.create(parameters)
		flash[:alert] = "Error: " + resource.errors.full_messages.first if resource.errors.any?
		redirect_to resources_path
	end

	def edit
		id = params.require(:id)
		@resource = Resource.find(id)
		if @resource.user != current_user
			flash[:alert] = "That is not your resource!"
			redirect_to :resources
		end
	end

	def update
		id = params.require(:id)
		updates = params.require(:resource).permit(:title, :url, :description)
		resource = Resource.find(id)
		if resource.user != current_user
			flash[:alert] = "That is not your resource!"
			redirect_to :resources
		end
		resource.update(updates)
		flash[:alert] = "Error: " + resource.errors.full_messages.first if resource.errors.any?
		redirect_to resources_path
	end

	def destroy
		id = params[:id]
		resource = Resource.find_by_id(id)
		if resource.user != current_user
			flash[:alert] = "That is not your resource!"
			redirect_to :resources
		end
		Resource.destroy(id)
		redirect_to resources_path
	end

end
