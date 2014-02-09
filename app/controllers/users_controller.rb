class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		id = params.require(:id)
		@user = User.find(id)
	end

	def form
		id = params.require(:id)
		@user = User.find(id)
	end

	def change_role
		id = params.require(:id)
		update = params.require(:role)
		user = User.find(id)
		user.update_attribute(:role, update)
		redirect_to users_path
	end

end