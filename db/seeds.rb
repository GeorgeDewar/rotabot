# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

george = Person.create!(first_name: "George", last_name: "Dewar")
rachel = Person.create!(first_name: "Rachel", last_name: "Dewar")

sound_roster = Roster.create!(name: "Sound Desk", period: :weekly)

sound_roster.assignments.create!(person: rachel, year: 2017, week_number: 15)
sound_roster.assignments.create!(person: george, year: 2017, week_number: 16)

sound_roster.plan

opening_roster = Roster.create!(name: "Opening", period: :monthly)
opening_roster.plan
