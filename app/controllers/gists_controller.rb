class GistsController < ApplicationController

	def index
		@gists = Gist.all
	end

	def new
		if current_user.role == "instructor"
			@gist = Gist.new
		else
			flash[:alert] = "You must be in instructor"
			redirect_to gists_path
		end
	end

	def create
		if current_user.role == "instructor"
			parameters = params.require(:gist).permit(:title, :url)
			gist = current_user.gists.create(parameters)
			flash[:alert] = "Error: " + gist.errors.full_messages.first if gist.errors.any?
			redirect_to gists_path
		else
			flash[:alert] = "You must be in instructor"
			redirect_to gists_path
		end
	end

	def edit
		if current_user.role == "instructor"
			id = params.require(:id)
			@gist = Gist.find(id)
			# if @gist.user != current_user
			# 	redirect_to gists_path
			# 	flash[:alert] = "You can only edit gists you have posted"
			# end
		else
			flash[:alert] = "You must be in instructor"
			redirect_to gists_path
		end
	end

	def update
		if current_user.role == "instructor"
			id = params.require(:id)
			updates = params.require(:gist).permit(:title, :url)
			gist = Gist.find(id)
			# if gist.user != current_user
			# 	redirect_to gists_path
			# 	flash[:alert] = "You can only edit gists you have posted"
			# end
			gist.update(updates)
			flash[:alert] = "Error: " + gist.errors.full_messages.first if gist.errors.any?
			redirect_to gists_path
		else
			flash[:alert] = "You must be in instructor"
			redirect_to gists_path
		end
	end

	def destroy
		if current_user.role == "instructor"
			id = params[:id]
			gist = Gist.find_by_id(id)
			# if gist.user != current_user
			# 	redirect_to gists_path
			# 	flash[:alert] = "You can only delete gists you have posted"
			# end
			Gist.destroy(id)
			redirect_to gists_path
		else
			flash[:alert] = "You must be in instructor"
			redirect_to gists_path
		end
	end

end
