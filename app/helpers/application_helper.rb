module ApplicationHelper

	def instructors
		User.where(:role => "instructor")
	end

	def students
		User.where(:role => "student")
	end


end
