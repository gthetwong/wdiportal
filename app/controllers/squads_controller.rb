class SquadsController < ApplicationController

	def index
		empty_squads = Squad.all
		empty_squads.each do |squad|
			squad.destroy if ( squad_instructor(squad).empty? )
		end
		@squads = Squad.all
	end

	def new
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		@squad = Squad.new
		@instructors = User.where(:role => "instructor")
		@unassigned_instructors = instructors_without_squad
		@unassigned_students = students_without_squad
	end

	def show
		id = params.require(:id)
		@squad = Squad.find(id)
	end

	def create
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		squad = Squad.create
		squad.users << User.find_by_id(params[:squad_instructor])
		students = params[:squad_students]["add"] unless params[:squad_students].nil?
		if !students.nil?
			students.each do |s|
				student = User.find_by_id(s)
				squad.users << student
			end
		end
		redirect_to squads_path
	end

	def edit
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		id = params.require(:id)
		@squad = Squad.find(id)
		@assigned_students = squad_students(@squad)
		@unassigned_students = students_without_squad - @assigned_students
	end

	def update
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		redirect_to squads_path
	end

	def destroy
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		id = params[:id]
		squad = Squad.find_by_id(id)
		users = squad.users

		users.each do |user|
			user.update_attribute(:squad_id, nil)
		end

		squad.destroy
		redirect_to squads_path
	end

	def reset
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		squads = Squad.all
		squads.each do |squad|
			instructor = squad_instructor(squad)
			squad.users = instructor
		end
		redirect_to squads_path
	end

	def add_student
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		student_id = params[:student]
		squad_id = params[:squad]
		student = User.find_by_id(student_id)
		squad = Squad.find_by_id(squad_id)

		squad.users << student

		redirect_to edit_squad_path(squad)
	end

	def remove_student
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :squads
		end
		student_id = params[:student]
		squad_id = params[:squad]
		student = User.find_by_id(student_id)
		squad = Squad.find_by_id(squad_id)

		squad.users.delete(student)

		redirect_to edit_squad_path(squad)
	end

end
