class UsersController < ApplicationController

	def index
		current_user.visits.create(action: "view users")
		@users = User.all
	end

	def show
		current_user.visits.create(action: "view user")
		if params[:id].nil?
			@user = current_user
		else
			@user = User.find(params[:id])
		end
		unless ( @user.squad.nil? || @user.squad.users.where(:role => "instructor").first.nil? )
			@instructor = @user.squad.users.where(:role => "instructor").first.firstname
		end
		@students = @user.squad.users.where(:role => "student") unless @user.squad.nil?
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
			current_user.visits.create(action: "UNAUTHORIZED attempt to change user role")
			redirect_to :users
		end
		id = params.require(:id)
		update = params.require(:role)
		user = User.find(id)
		user.update_attribute(:role, update)
		redirect_to users_path
	end

	def random_student
		@students = User.where(role: "student")
		@random_student = @students.sample
	end

end