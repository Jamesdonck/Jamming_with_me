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

locations = [
  'Rua Conde Redondo, Lisboa',
  'Av. da Liberdade, Lisboa',
  'Jardim do Arco do Cego, Lisboa',
  'Parque Eduardo VII, Lisboa',
  'Saldanha, Lisboa',
  'Entrecampos, Lisboa'
]

titles = [
  'Jammin with da bois',
  'Guitar + Drums delightful duo looking for extras',
  'Jammin in the park',
  'Free spirit trying to connect through music',
  'In need of a xylophone player',
  'Putting the JAM in jam sessions '
]

puts 'Creating jams'
for i in 0..6 do
  Jam.create!(
    title: titles[i],
    description: Faker::Hipster.sentence,
    user: User.find(User.pluck(:id).sample),
    location: locations[i],
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end
