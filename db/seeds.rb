# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Template:
# Athlete.create!(name:     "string",
#                 level:    integer,
#                 positive: integer,
#                 negative: integer)

# 30.times do |n|
#   name = (0...8).map { (65 + rand(26)).chr }.join
#   level = rand(1..5)
#   Athlete.create!(name: name,
#                   level: level,
#                   rating: 0)
# end

# sub list
# seed_list = [
#   [ "PARE, HUBERT", 1 ],
#   [ "LEE, JB", 2 ],  
#   [ "GOT, MATTHIEU", 2 ],
#   [ "CHANG, JAEHO", 2 ],
#   [ "SHIPP, ALEX", 2 ],
#   [ "PARK, ANDREW", 3 ],  
#   [ "HAN, DAVID", 3 ],
#   [ "LEE, SOPHIA", 3 ],
#   [ "KHALIL, UMAER", 4 ],  
#   [ "DELANEY, DAMIAN", 4 ],
#   [ "EUH, JAE", 4 ],
#   [ "LEE, BRIAN", 5 ],
#   [ "NORTHRUP, GREG", 5 ],
#   [ "VICKERY, BEN", 5 ],
#   [ "FLYNN, JOE", 5 ],
#   [ "LEE, HEEWON", 5 ]
# ]

# regular players
# seed_list = [
#   [ "LEE, DS", 1 ],
#   [ "MACARTHUR, DAVID", 2 ],
#   [ "HWANG, KWANG", 3 ],
#   [ "KIM, KEVIN", 4 ],
#   [ "LEROI, FLORENT", 5 ],
#   [ "AHN, JASON", 1 ],
#   [ "RUESCHE, FREDERIC", 2 ],
#   [ "EUH, JASON", 3 ],
#   [ "KIM, BS", 4 ],
#   [ "HAHM, KEVIN", 5 ],
#   [ "CATHERINE, HUGO", 1 ],
#   [ "CHANG, HAROLD", 2 ],
#   [ "LEE, VIV", 3 ],
#   [ "CHANG, JOSEPH", 4 ],
#   [ "KIM, HAESUNG", 5 ],
#   [ "YOON, KEVIN", 1  ],
#   [ "DUDLEY, GORDON", 2 ],
#   [ "CHANG, ANTHONY", 3 ],
#   [ "BUDDEN, MATT", 4 ],
#   [ "SUH, MARK", 5 ],
#   [ "JOHNSTONE, GRAHAM", 1 ],
#   [ "CHUN, JOHAN", 2 ],
#   [ "ROSSO, PABLO", 3 ],
#   [ "RA, KYUNGSOO", 4 ],
#   [ "CHUNG, MARK", 5 ],
#   [ "DEBOER, ARTHUR", 1 ],
#   [ "AHN, EDWARD", 2 ],
#   [ "LEHMAN, THOMAS", 3 ],
#   [ "KOSTENBADER, BENJI", 4 ],
#   [ "HWANG, JOSHUA", 5 ],
#   [ "JEONG, YOUNGSU", 1 ],
#   [ "LIM, LOUIS", 2 ],
#   [ "LIM, SAM", 3 ],
#   [ "HOXER, MARTIN", 4 ],
#   [ "SUNG, CHAN", 5 ],
#   [ "SALINAS, MARK", 1 ],
#   [ "JUNG, LEO", 2 ],
#   [ "AHN, DAVID", 3 ],
#   [ "ADRIAEN, MICHAEL", 4 ],
#   [ "CHANG, ALEX", 5 ]
# ]

seed_list.each do | name, level |
  Athlete.create!( name: name, level: level, positive: 0, negative: 0 )
end