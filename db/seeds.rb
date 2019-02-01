# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Athlete.create!(name:"KOSTENBADER, BENJI",
                level: 4,
                rating: 0)

# 30.times do |n|
#   name = (0...8).map { (65 + rand(26)).chr }.join
#   level = rand(1..5)
#   Athlete.create!(name: name,
#                   level: level,
#                   rating: 0)
# end