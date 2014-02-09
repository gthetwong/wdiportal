class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		parameters = params.require(:project).permit(:title, :url, :technology, :description)
		project = Project.create(parameters)
		redirect_to projects_path
	end

	def edit
		id = params.require(:id)
		@project = Project.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:project).permit(:title, :url, :technology, :description)
		project = Project.find(id)
		project.update(updates)
		redirect_to projects_path
	end

	def destroy
		id = params[:id]
		Project.destroy(id)
		redirect_to projects_path
	end

	def join
		id = params.require(:id)
		project = Project.find(id)
		project.users << current_user
		flash[:notice] = "Good luck working on #{project.title}!"
		redirect_to projects_path
	end

end
