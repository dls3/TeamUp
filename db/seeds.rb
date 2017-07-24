# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ADDING TENNIS COURTS TO COURT_FIELDS FROM CSV
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Tennis Courts Facilities Data 2017.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  # headers become keys
  if row['Primary Permitting Status'] == 'Public'
    court = CourtField.new

    court.name = row['NAME']
    court.address = row['ADDRESS']
    court.neighbourhood = row['DISTRICT']
    court.save
    puts "#{court.name} was saved"
  end
end

# Creating fake game

masha = User.create!(
  name: "Masha",
  email: "masha@gmail.com",
  password: "bitmaker"
)

tennis_game = Game.create!(
  date: "September 24, 2017",
  time: "4pm",
  skill: "low",
  event_name: "Tennis Game",
  sport: "Tennis",
  players_needed: 2,
  current_players: 1,
  description: "Looking for a partner to play tennis with!",
  user: masha
)
