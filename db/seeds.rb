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
    court.latitude = row['latitude']
    court.longitude = row['longitude']
    court.num_courts = row['Num_courts']
    court.sport = row['Sport']
    court.save
    puts "#{court.name} was saved"
  end
end
