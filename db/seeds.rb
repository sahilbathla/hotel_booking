# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(A B C D).each do |_alphabet|
  #Create Deluxe Room
  (1..5).to_a.each do |n|
    DeluxeRoom.find_or_create_by(name: _alphabet + n.to_s, price: 7000)
  end
  (6..10).to_a.each do |n|
    LuxuryRoom.find_or_create_by(name: _alphabet + n.to_s, price: 8500)
  end
end

#Create Luxury Suites
(11..20).to_a.each do |n|
  LuxurySuite.find_or_create_by(name: 'D' + n.to_s, price: 12000)
end
(1..2).to_a.each do |n|
  LuxurySuite.find_or_create_by(name: 'E' + n.to_s, price: 12000)
end

#Create Presedential Suites
(3..10).to_a.each do |n|
  PresedentialSuite.find_or_create_by(name: 'E' + n.to_s, price: 20000)
end
