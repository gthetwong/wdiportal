class LabsController < ApplicationController

	def index
		@labs = Lab.all
	end

	def new
		if current_user.role != "student"
			flash[:alert] = "You must be a student to submit a lab"
			redirect_to :labs
		end
		@lab = Lab.new
		@assignments = Assignment.all
	end

	def create
		if current_user.role != "student"
			flash[:alert] = "You must be a student to submit a lab"
			redirect_to :labs
		end
		parameters = params.require(:lab).permit(:url, :comment)
		parameters["feeling"] = params[:feeling]
		assignment = Assignment.find_by_id(params[:lab_assignment])

		lab = current_user.labs.create(parameters)
		flash[:alert] = "Error: " + lab.errors.full_messages.first if lab.errors.any?

		assignment.labs << lab
		current_user.labs << lab

		redirect_to assignments_path
	end

	def edit
		if current_user.role != "student"
			flash[:alert] = "You must be a student"
			redirect_to :labs
		end
		id = params.require(:id)
		@lab = Lab.find(id)
	end

	def update
		if current_user.role != "student"
			flash[:alert] = "You must be a student"
			redirect_to :labs
		end
		id = params.require(:id)
		updates = params.require(:lab).permit(:url, :comment)
		updates["feeling"] = params[:feeling]
		lab = Lab.find(id)
		lab.update(updates)
		flash[:alert] = "Error: " + lab.errors.full_messages.first if lab.errors.any?
		redirect_to labs_path
	end

	def destroy
		if current_user.role != "student"
			flash[:alert] = "You must be a student"
			redirect_to :labs
		end
		id = params[:id]
		Lab.destroy(id)
		redirect_to labs_path
	end

end
