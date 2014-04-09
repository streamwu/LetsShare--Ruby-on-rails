# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


directors_file = Rails.root.join('db', 'directors.json')
director_hashes = JSON.parse(open(directors_file).read)

Director.destroy_all
director_hashes.each do |director_hash|
  d = Director.new
  if Director.find_by(name: director_hash["name"]).nil?
    d.name = director_hash["name"]
    d.photo_url = director_hash["image_url"]
    d.bio = director_hash["bio"]
    d.save
  end
end
puts "There are now #{Director.count} rows in the directors table."

movies_file = Rails.root.join('db', 'movies.json').to_s
movie_hashes = JSON.parse(open(movies_file).read)

Movie.destroy_all
movie_hashes.each do |movie_hash|
  m = Movie.new
  m.title = movie_hash["title"]
  m.year = movie_hash["year"]
  m.duration = movie_hash["duration"]
  m.plot = movie_hash["description"]
  m.poster_url = movie_hash["image_url"]
  d = Director.find_by(name: movie_hash["director"])
  m.director_id = d.id if d.present?
  m.save
end
puts "There are now #{Movie.count} rows in the movies table."


actors_file = Rails.root.join('db', 'actors.json').to_s
actor_hashes = JSON.parse(open(actors_file).read)

Actor.destroy_all
actor_hashes.each do |actor_hash|
  a = Actor.new
  a.name = actor_hash["name"]
  a.photo_url = actor_hash["image_url"]
  a.bio = actor_hash["bio"]
  a.save
end
puts "There are now #{Actor.count} rows in the actors table."

roles_file = Rails.root.join('db', 'roles.json').to_s
role_hashes = JSON.parse(open(roles_file).read)

Role.destroy_all
role_hashes.each do |role_hash|
  r = Role.new
  r.name = role_hash["name"]
  m = Movie.find_by(title: role_hash["movie"])
  a = Actor.find_by(name: role_hash["actor"])
  r.movie_id = m.id if m.present?
  r.actor_id = a.id if a.present?
  r.save
end
puts "There are now #{Role.count} rows in the roles table."

# all_movie_data = [ { :title => "Apollo 13",
#                  :year => 1995,
#                  :plot => "Three astronauts must devise a strategy to return to Earth safely after their spacecraft undergoes massive internal damage.",
#                  :image_url => "http://ia.media-imdb.com/images/M/MV5BMTM2Njg2NjU5NF5BMl5BanBnXkFtZTYwODI5MDc4._V1_SY226_SX144_.jpg"
#                 },
#                 { :title => "Lincoln",
#                   :year => 2012,
#                   :plot => "As the Civil War continues to rage, America's president struggles with continuing carnage on the battlefield and as he fights with many inside his own cabinet on the decision to emancipate the slaves.",
#                   :image_url => "http://ia.media-imdb.com/images/M/MV5BMTQzNzczMDUyNV5BMl5BanBnXkFtZTcwNjM2ODEzOA@@._V1_SY317_CR0,0,214,317_.jpg"
#                 },
#                 { :title => "Star Wars",
#                   :year => 1977,
#                   :plot => "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the universe from the Empire's world-destroying battle-station, while also attempting to rescue Princess Leia from the evil Darth Vader.",
#                   :image_url => "http://ia.media-imdb.com/images/M/MV5BMTU4NTczODkwM15BMl5BanBnXkFtZTcwMzEyMTIyMw@@._V1_SX214_.jpg"
#                 },
#                 { :title => "Raiders of the Lost Ark",
#                   :year => 1981,
#                   :plot => "Archeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant before the Nazis.",
#                   :image_url => "http://ia.media-imdb.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_SX214_.jpg"
#                 },
#                 { :title => "Backdraft",
#                   :year => 1991,
#                   :plot => "Two Chicago firefighter brothers who don't get along have to work together while a dangerous arsonist is on the loose.",
#                   :image_url => "http://ia.media-imdb.com/images/M/MV5BMTY2NTI5ODIwOV5BMl5BanBnXkFtZTcwMDI2ODMzMQ@@._V1_SY317_CR6,0,214,317_.jpg"
#                 }
#             ]

# Movie.destroy_all
# all_movie_data.each do |movie_info|
#   m = Movie.new
#   m.title = movie_info[:title]
#   m.year = movie_info[:year]
#   m.plot = movie_info[:plot]
#   m.image_url = movie_info[:image_url]
#   m.save
# end

# all_director_data = [ { name: "Ron Howard", photo_url: 'http://ia.media-imdb.com/images/M/MV5BMTkzMDczMjUxNF5BMl5BanBnXkFtZTcwODY1Njk5Mg@@._V1_SX214_CR0,0,214,317_.jpg' },
#                   { name: "Steven Spielberg", photo_url: 'http://ia.media-imdb.com/images/M/MV5BMTY1NjAzNzE1MV5BMl5BanBnXkFtZTYwNTk0ODc0._V1_SX214_CR0,0,214,317_.jpg' },
#                   { name: "George Lucas", photo_url: 'http://ia.media-imdb.com/images/M/MV5BMTA0Mjc0NzExNzBeQTJeQWpwZ15BbWU3MDEzMzQ3MDI@._V1_SY317_CR0,0,214,317_.jpg' }
#                 ]

# Director.destroy_all
# all_director_data.each do |director_info|
#   Director.create(:name => director_info[:name], :photo_url => director_info[:photo_url])
# end

# m = Movie.find_by(title: 'Apollo 13')
# d = Director.find_by(name: 'Ron Howard')
# m.director_id = d.id
# m.save

# m = Movie.find_by(title: 'Backdraft')
# m.director_id = d.id
# m.save
