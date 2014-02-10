# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


n = User.create(firstname: "Noah", lastname: "Kaplan", email: "noah@email.com", password: "password", password_confirmation: "password", role: "instructor")
c = User.create(firstname: "Carina", lastname: "Ho", email: "carina@email.com", password: "password", password_confirmation: "password", role: "coordinator")
one = User.create(firstname: "One", lastname: "Student", email: "student1@email.com", password: "password", password_confirmation: "password")
two = User.create(firstname: "Two", lastname: "Student", email: "student2@email.com", password: "password", password_confirmation: "password")
three = User.create(firstname: "Three", lastname: "Student", email: "student3@email.com", password: "password", password_confirmation: "password")

n.assignments.create(title: "Animal Shelter", url: "http://google.com")
n.assignments.create(title: "OMDB App", url: "http://google.com")

c.events.create(title: "Bowling", date: Date.today, time: Time.now, location: "414 Brannan St", description: "Beer", cost: 0)
c.events.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)

n.gists.create(title: "User Authentication", url: "http://google.com")
n.gists.create(title: "Ruby Controller", url: "http://google.com")

one.labs.create(url: "http://google.com", comment: "This was hard.", feeling: "I'm not sure")
two.labs.create(url: "http://google.com", comment: "This wasn't too bad.", feeling: "I did well")

one.projects.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find articles")
three.projects.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit")

three.resources.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
n.resources.create(title: "Formbuilder", url: "http://google.com", description: "Make forms in bootstrap")