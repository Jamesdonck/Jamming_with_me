# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating users...'
20.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    bio: Faker::Lorem.sentence,
    password: 'topsecret',
    password_confirmation: 'topsecret'
  )
end

puts 'Creating jams'
10.times do
  Jam.create!(
    # title: Faker::Hipster.sentence(word_count: 3)
    # description: Faker::Hipster.sentence
    user: User.find(User.pluck(:id).sample),
    location: Faker::Address.full_address,
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end
