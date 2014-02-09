module SquadsHelper

	def squad_instructor(squad)
		squad.users.where(:role => "instructor")
	end

	def squad_students(squad)
		squad.users.where(:role => "student")
	end

end
