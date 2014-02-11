class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		@assignment = Assignment.new
	end

	def create
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		parameters = params.require(:assignment).permit(:title, :url)
		assignment = Assignment.create(parameters)
		flash[:alert] = "Error: " + assignment.errors.full_messages.first if assignment.errors.any?
		redirect_to assignments_path
	end

	def edit
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		id = params.require(:id)
		@assignment = Assignment.find(id)
	end

	def update
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		id = params.require(:id)
		updates = params.require(:assignment).permit(:title, :url)
		assignment = Assignment.find(id)
		assignment.update(updates)
		flash[:alert] = "Error: " + assignment.errors.full_messages.first if assignment.errors.any?
		redirect_to assignments_path
	end

	def destroy
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		id = params[:id]
		Assignment.destroy(id)
		redirect_to assignments_path
	end

	def submissions
		if current_user.role != "instructor"
			flash[:alert] = "You must be a instructor"
			redirect_to :assignments
		end
		id = params[:assignment]
		@assignment = Assignment.find_by_id(id)
	end

end
