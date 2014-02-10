class LabsController < ApplicationController

	def index
		@labs = Lab.all
	end

	def new
		@lab = Lab.new
		@assignments = Assignment.all
	end

	def create
		parameters = params.require(:lab).permit(:url, :comment)
		parameters["feeling"] = params[:feeling]
		assignment = Assignment.find_by_id(params[:lab_assignment])

		lab = Lab.create(parameters)
		flash[:alert] = lab.errors.full_messages.first if lab.errors.any?

		assignment.labs << lab
		current_user.labs << lab

		redirect_to labs_path
	end

	def edit
		id = params.require(:id)
		@lab = Lab.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:lab).permit(:url, :comment)
		updates["feeling"] = params[:feeling]
		lab = Lab.find(id)
		lab.update(updates)
		flash[:alert] = lab.errors.full_messages.first if lab.errors.any?
		redirect_to labs_path
	end

	def destroy
		id = params[:id]
		Lab.destroy(id)
		redirect_to labs_path
	end

end
