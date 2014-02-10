class Assignment < ActiveRecord::Base

	belongs_to :user
	has_many :labs

	validates :title, presence: true
	validates :url, presence: true

end
