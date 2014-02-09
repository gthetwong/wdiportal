class SquadsController < ApplicationController

	include SquadsHelper

	def index
		@squads = Squad.all
	end

	def new
		@squad = Squad.new
		@instructors = instructors
	end

	def show
		id = params.require(:id)
		@squad = Squad.find(id)
	end

	def create
		parameters = params.require(:squad).permit(:title, :date, :location, :cost, :description)
		squad = Squad.create(parameters)
		redirect_to squads_path
	end

	def edit
		id = params.require(:id)
		@squad = Squad.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:squad).permit(:title, :date, :location, :cost, :description)
		squad = Squad.find(id)
		squad.update(updates)
		redirect_to squads_path
	end

	def destroy
		id = params[:id]
		Squad.destroy(id)
		redirect_to squads_path
	end

	def reset
		squads = Squad.all
		squads.each do |squad|
			instructor = squad_instructor(squad)
			squad.users = instructor
		end
		redirect_to squads_path
	end

end
