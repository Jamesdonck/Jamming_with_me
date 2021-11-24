# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting bookings...'
Booking.destroy_all
puts 'Deleting jams...'
Jam.destroy_all
puts 'Deleting users...'
User.destroy_all
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

User.create!(
  username: 'admin',
  email: 'admin@admin.com',
  bio: "I am the admin",
  password: '123123',
  password_confirmation: '123123'
)

User.create!(
  username: 'Jovis',
  email: 'Jovis@admin.com',
  bio: "I am Jovis",
  password: '123456',
  password_confirmation: '123456'
)

puts 'Creating jams'
images = []
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637757070/tmfpsn2ketgf08n4eiuz.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637756427/rgg4n987j2jzutaig7uh.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637755359/fpcz4pmak4hhsktftt9b.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637755944/jwju5uiu1vybq9ffif8e.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637755027/etdlndd2rccifx1pkbkz.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637754868/d4nirgzzpzcjgpdlcrkg.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637754798/gtuir2cw2leisweuzaus.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637754571/w0fbmdqboeheahmif62l.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637756561/ihdkxpsu3byl59y4quca.jpg"))
images.push(URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637756839/evy5t5zamg1eegofyxrx.jpg"))

10.times do
  Jam.create!(
    title: Faker::Hipster.sentence(word_count: 3),
    description: Faker::Hipster.sentence,
    user: User.find(User.pluck(:id).sample),
    location: Faker::Address.full_address,
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

Jam.all.foreach do |jam|
  jam.photo.attach(images.pop)
end

jam1 = Jam.create(
    title: Faker::Hipster.sentence(word_count: 3),
    description: Faker::Hipster.sentence,
    user: User.find(User.pluck(:id).sample),
    location: Faker::Address.full_address,
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
image1 = URI.open("https://res.cloudinary.com/drfv43ng3/image/upload/v1637757070/tmfpsn2ketgf08n4eiuz.jpg")
jam1.photo.attach(image1)
