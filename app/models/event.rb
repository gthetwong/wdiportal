class Event < ActiveRecord::Base

	has_many :attends
	has_many :users, through: :attends

	validates :title, presence: true
	validates :date, presence: true
	validates :location, presence: true
	validates :cost, presence: true
	validates :description, presence: true

end
