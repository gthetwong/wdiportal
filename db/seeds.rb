# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


n = User.create(firstname: "Noah", lastname: "Kaplan", email: "noahkaplan4@gmail.com", password: "password", password_confirmation: "password", role: "instructor")
c = User.create(firstname: "Carina", lastname: "Ho", email: "carina@email.com", password: "password", password_confirmation: "password", role: "coordinator")
one = User.create(firstname: "One", lastname: "Student", email: "student1@email.com", password: "password", password_confirmation: "password")
two = User.create(firstname: "Two", lastname: "Student", email: "student2@email.com", password: "password", password_confirmation: "password")
three = User.create(firstname: "Three", lastname: "Student", email: "student3@email.com", password: "password", password_confirmation: "password")

# c.events.create(title: "Bowling", date: Date.today, time: Time.now, location: "414 Brannan St", description: "Beer", cost: 0)
# c.events.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)

a = Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find articles")
b = Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit")

c = Resource.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
d = Resource.create(title: "Formbuilder", url: "http://google.com", description: "Make forms in bootstrap")

one.projects << a
three.projects << b

n.resources << c
two.resources << d