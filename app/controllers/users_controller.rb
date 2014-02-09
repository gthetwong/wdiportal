class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		id = params.require(:id)
		@user = User.find(id)
	end

	def edit
		id = params.require(:id)
		@user = User.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:user).permit(:title, :date, :location, :cost, :description)
		user = User.find(id)
		user.update(updates)
		redirect_to users_path
	end

end