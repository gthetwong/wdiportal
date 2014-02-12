class GistsController < ApplicationController

	def index
		@gists = Gist.all
	end

	def new
		if current_user.email == "noahkaplan4@gmail.com"
			@gist = Gist.new
		else
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

	def create
		if current_user.email == "noahkaplan4@gmail.com"
			parameters = params.require(:gist).permit(:title, :url)
			gist = Gist.create(parameters)
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
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

	def update
		if current_user.email == "noahkaplan4@gmail.com"
			id = params.require(:id)
			updates = params.require(:gist).permit(:title, :url)
			gist = Gist.find(id)
			gist.update(updates)
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
			redirect_to gists_path
		else
			flash[:alert] = "You are not authrorized to create a gist"
			redirect_to gists_path
		end
	end

end
