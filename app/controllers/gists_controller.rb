class GistsController < ApplicationController

	def index
		current_user.visits.create(action: "view gists")
		@gists = Gist.all
	end

	def new
		if current_user.email == "noahkaplan4@gmail.com"
			@gist = Gist.new
		else
			flash[:alert] = "You are not authrorized to create a gist"
			current_user.visits.create(action: "UNAUTHORIZED attempt to create gist")
			redirect_to gists_path
		end
	end

	def create
		if current_user.email == "noahkaplan4@gmail.com"
			parameters = params.require(:gist).permit(:title, :url, :instructor)
			gist = Gist.create(parameters)
			current_user.visits.create(action: "create gist")
			flash[:alert] = "Error: " + gist.errors.full_messages.first if gist.errors.any?
			redirect_to gists_path
		else
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

	def edit
		if current_user.email == "noahkaplan4@gmail.com"
			id = params.require(:id)
			@gist = Gist.find(id)
		else
			flash[:alert] = "You are not authrorized to edit a gist"
			current_user.visits.create(action: "UNAUTHORIZED attempt to edit gist")
			redirect_to gists_path
		end
	end

	def update
		if current_user.email == "noahkaplan4@gmail.com"
			id = params.require(:id)
			updates = params.require(:gist).permit(:title, :url, :instructor)
			gist = Gist.find(id)
			gist.update(updates)
			current_user.visits.create(action: "edit gist")
			flash[:alert] = "Error: " + gist.errors.full_messages.first if gist.errors.any?
			redirect_to gists_path
		else
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

	def destroy
		if current_user.email == "noahkaplan4@gmail.com"
			id = params[:id]
			gist = Gist.find_by_id(id)
			Gist.destroy(id)
			current_user.visits.create(action: "delete gist")
			redirect_to gists_path
		else
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

end
