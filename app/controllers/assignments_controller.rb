class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		@assignment = Assignment.new
	end

	def create
		parameters = params.require(:assignment).permit(:title, :url)
		assignment = Assignment.create(parameters)
		redirect_to assignments_path
	end

	def edit
		id = params.require(:id)
		@assignment = Assignment.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:assignment).permit(:title, :url)
		assignment = Assignment.find(id)
		assignment.update(updates)
		redirect_to assignments_path
	end

	def destroy
		id = params[:id]
		Assignment.destroy(id)
		redirect_to assignments_path
	end

end
