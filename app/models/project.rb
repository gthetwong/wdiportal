class Project < ActiveRecord::Base

	has_many :group_projects
	has_many :users, through: :group_projects

	validates :title, presence: true
	validates :url, presence: true
	validates :technology, presence: true
	validates :description, presence: true

end
