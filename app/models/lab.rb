class Lab < ActiveRecord::Base

	belongs_to :user
	belongs_to :assignment

	validates :url, presence: true
	validates :feeling, presence: true

end
