module SquadsHelper

	def squad_instructor(squad)
		squad.users.where(:role => "instructor")
	end

	def squad_students(squad)
		squad.users.where(:role => "student")
	end

	def instructors_without_squad
		User.where(:role => "instructor", :squad_id => nil)
	end

	def students_without_squad
		User.all.each do |student|
			student.update_attribute(:squad_id, nil) if Squad.find_by_id(student.squad_id).nil?
		end
		User.where(:role => "student", :squad_id => nil)
	end

end
