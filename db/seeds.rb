# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ADDING TENNIS COURTS TO COURT_FIELDS FROM CSV
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'tennis_courts_facilities_data_2017.csv'))
csv = CSV.parse(csv_text, :headers => true) #, :encoding => 'ISO-8859-1')
csv.each do |row|  # headers become keys
  t = CourtField.new
  t.name = row['NAME']
  t.address = row['ADDRESS']
  t.neighbourhood = row['NEIGHBOURHOOD']
  t.save
  puts "#{t.name} saved"
end

puts "There are #{CourtField.count} rows in the court_fields table"
