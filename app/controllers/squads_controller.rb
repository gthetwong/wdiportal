class SquadsController < ApplicationController

	include SquadsHelper

	def index
		@squads = Squad.all
	end

	def new
		@squad = Squad.new
		@instructors = instructors
		@students = students
	end

	def show
		id = params.require(:id)
		@squad = Squad.find(id)
	end

	def create
		squad = Squad.create
		squad.users << User.find_by_id(params[:squad_instructor])
		students = params[:squad_students]["add"] unless params[:squad_students].nil?
		students.each do |s|
			student = User.find_by_id(s)
			squad.users << student
		end
		redirect_to squads_path
	end

# def update
# 	id = params[:id]
# 	updates = params.require(:product).permit(:name, :description)
# 	product = Product.find(id)
# 	product.update(updates)

# 	unless params[:categories].nil?
# 		add_categories = []
# 		remove_categories = []

# 		unless params[:categories]["add"].nil?
# 			params[:categories]["add"].each do |category|
# 				category_object = Category.where :name => category
# 				add_categories << category_object
# 			end
# 		end

# 		unless params[:categories]["remove"].nil?
# 			params[:categories]["remove"].each do |category|
# 				category_object = Category.where :name => category
# 				remove_categories << category_object
# 			end
# 		end

# 		product.categories << add_categories
# 		product.categories.destroy(remove_categories)
# 	end

# 	redirect_to product
# end





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
