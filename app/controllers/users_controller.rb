class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		id = params.require(:id)
		@user = User.find(id)
		unless ( @user.squad.nil? )
			@instructor = @user.squad.users.where(:role => "instructor").first.firstname
		end
		@students = @user.squad.users.where(:role => "student") unless @user.squad.nil?
		unless ( current_user.role == "instructor" || current_user.role == "coordinator" || @user == current_user )
			redirect_to users_path
		end
	end

	def form
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator to change a user's role"
			redirect_to :users
		end
		id = params.require(:id)
		@user = User.find(id)
	end

	def change_role
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator to change a user's role"
			redirect_to :users
		end
		id = params.require(:id)
		update = params.require(:role)
		user = User.find(id)
		user.update_attribute(:role, update)
		redirect_to users_path
	end

end