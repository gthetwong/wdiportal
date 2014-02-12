class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resources
  has_many :labs
  has_many :assignments

  has_many :group_projects
  has_many :projects, through: :group_projects

  has_many :attends
  has_many :events, through: :attends
  
  belongs_to :squad

end

