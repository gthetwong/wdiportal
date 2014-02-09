class Event < ActiveRecord::Base

  has_many :attends
  has_many :users, through: :attends

end
