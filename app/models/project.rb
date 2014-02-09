class Project < ActiveRecord::Base

	has_many :group_projects
	has_many :users, through: :group_projects

end
