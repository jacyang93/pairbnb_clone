# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'
gender = ["male", "female"]

ActiveRecord::Base.transaction do
  20.times do
    user['name'] = Faker::Name.first_name
    user['email'] = Faker::Internet.email
    user['gender'] = gender.sample
    user['birthday'] = Faker::Date.between(50.years.ago, Date.today)
    user['age'] = (Date.today - Faker::Date.between(50.years.ago, Date.today)) / 365

    User.create(user)
  end
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do

    listing['number_of_rooms'] = rand(0..5)

    listing['address'] = Faker::Address.street_address

    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
