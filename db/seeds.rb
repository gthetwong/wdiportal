# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


n = User.create(firstname: "Noah", lastname: "Kaplan", githubhandle: "ghfjdksgf", email: "noahkaplan4@gmail.com", password: "password", password_confirmation: "password", role: "instructor")
c = User.create(firstname: "Carina", lastname: "Ho", githubhandle: "fdsgsg", email: "carina@email.com", password: "password", password_confirmation: "password", role: "coordinator")
one = User.create(firstname: "One", lastname: "Student", githubhandle: "gdsafa", email: "student1@email.com", password: "password", password_confirmation: "password")
two = User.create(firstname: "Two", lastname: "Student", githubhandle: "ghgfdksgf", email: "student2@email.com", password: "password", password_confirmation: "password")
three = User.create(firstname: "Three", lastname: "Student", githubhandle: "fjdsag", email: "student3@email.com", password: "password", password_confirmation: "password")

m = Event.create(title: "Bowling", date: Date.today, time: Time.now, location: "414 Brannan St", description: "Beer", cost: 0)
o = Event.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)
p = Event.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)

a = Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find argfdticles ind argfdticle ind argfdticle ind argfdticle ind argfdticle ind argfdticle")
b = Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit Find shoes that fit Find shoes that fit Find shoes that fit")
c = Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find argfdticles ind argfdticle ind argfdticle ind argfdticle ind argfdticle ind argfdticle")
d = Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit Find shoes that fit Find shoes that fit Find shoes that fit")
e = Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find argfdticles ind argfdticle ind argfdticle ind argfdticle ind argfdticle ind argfdticle")
f = Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit Find shoes that fit Find shoes that fit Find shoes that fit")

g = Resource.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
h = Resource.create(title: "Formbuilder", url: "http://google.com", description: "Make foFind shoes that fit Find shoes that fit rms in bootstrap")
i = Resource.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
j = Resource.create(title: "Formbuilder", url: "http://google.com", description: "Make foFind shoes that fit Find shoes that fit rms in bootstrap")
k = Resource.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
l = Resource.create(title: "Formbuilder", url: "http://google.com", description: "Make foFind shoes that fit Find shoes that fit rms in bootstrap")


one.projects << a
one.projects << b
one.projects << c

one.events << m
one.events << o
one.events << p

n.resources << h
n.resources << g
n.resources << i

two.resources << k
two.resources << j
two.resources << l


