class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		parameters = params.require(:project).permit(:title, :url, :technology, :description)
		project = current_user.projects.create(parameters)
		flash[:alert] = "Error: " + project.errors.full_messages.first if project.errors.any?
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
		flash[:alert] = "Error: " + project.errors.full_messages.first if project.errors.any?
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
		if project.users.include?(current_user)
			flash[:notice] = "You're already working on #{project.title}!"
		else
			project.users << current_user
			flash[:notice] = "Good luck working on #{project.title}!"
		end
		redirect_to projects_path
	end

	def leave
		id = params.require(:id)
		project = Project.find(id)
		if ( project.users.include?(current_user) ) && ( project.users.count != 1 )
			project.users.delete(current_user)
			flash[:notice] = "You are no longer working on #{project.title}"
		elsif project.users.include?(current_user)
			flash[:alert] = "You are the only student for this project, and cannot leave it. Select EDIT to delete the project."
		else
			flash[:notice] = "You weren't working on #{project.title}"
		end
		redirect_to projects_path
	end

end
