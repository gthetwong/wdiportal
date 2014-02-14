# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


student = User.create(firstname: "Tanner", lastname: "Swenson", githubhandle: "tswengit", email: "tanner@email.com", password: "password", password_confirmation: "password")
student2 = User.create(firstname: "Stuart", lastname: "Stein", githubhandle: "unclestu", email: "stuart@email.com", password: "password", password_confirmation: "password")

g = Event.create(title: "Bowling", date: Date.today, time: Time.now, location: "414 Brannan St", description: "Beer and bowling", cost: 0)
h = Event.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)

a = Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit based on your friends shoes and their sizes.")
b = Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Connects neuroscientists based on where their research activated the brain.")
c = Project.create(title: "Gestalt Weather", url: "http://google.com", technology: "Weather underground", description: "Displays the weather in one graphic.")

d = Resource.create(title: "Buttons", url: "http://google.com", description: "Make custom buttons in Bootstrap.")
e = Resource.create(title: "Formbuilder", url: "http://google.com", description: "Form helper generator.")
f = Resource.create(title: "Roby Rogies", url: "http://google.com", description: "Podcast on how to learn.")

student.projects << a
student.projects << b
student.projects << c
student2.projects << c

student.events << g

student.resources << d
student.resources << e

student2.resources << f


