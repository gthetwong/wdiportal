# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Assignment.create(title: "Animal Shelter", url: "http://google.com")
Assignment.create(title: "OMDB App", url: "http://google.com")

Event.create(title: "Bowling", date: Date.today, time: Time.now, location: "414 Brannan St", description: "Beer", cost: 0)
Event.create(title: "Rock Climbing", date: Date.today, time: Time.now, location: "50 Fulton St", description: "Climbing rocks", cost: 5)

Gist.create(title: "User Authentication", url: "http://google.com")
Gist.create(title: "Ruby Controller", url: "http://google.com")

Lab.create(url: "http://google.com", comment: "This was hard.", feeling: "I'm not sure")
Lab.create(url: "http://google.com", comment: "This wasn't too bad.", feeling: "I did well")

Project.create(title: "Synapse", url: "http://google.com", technology: "Pubmed API", description: "Find articles")
Project.create(title: "Cinderella", url: "http://google.com", technology: "Zappos API", description: "Find shoes that fit")

Resource.create(title: "Buttons", url: "http://google.com", description: "Make buttons")
Resource.create(title: "Formbuilder", url: "http://google.com", description: "Make forms in bootstrap")