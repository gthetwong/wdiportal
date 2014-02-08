class LabsController < ApplicationController

	def index
		@labs = Lab.all
	end

	def new
		@lab = Lab.new
	end

	def create
		parameters = params.require(:lab).permit(:title, :url)
		lab = Lab.create(parameters)
		redirect_to labs_path
	end

	def edit
		id = params.require(:id)
		@lab = Lab.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:lab).permit(:title, :url)
		lab = Lab.find(id)
		lab.update(updates)
		redirect_to labs_path
	end

	def destroy
		id = params[:id]
		Lab.destroy(id)
		redirect_to labs_path
	end

end
