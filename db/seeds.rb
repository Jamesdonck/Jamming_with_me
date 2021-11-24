require 'open-uri'

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

urls = [
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637757070/tmfpsn2ketgf08n4eiuz.jpg",
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637756427/rgg4n987j2jzutaig7uh.jpg",
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637755359/fpcz4pmak4hhsktftt9b.jpg",
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637755944/jwju5uiu1vybq9ffif8e.jpg",
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637755027/etdlndd2rccifx1pkbkz.jpg",
  #"https://res.cloudinary.com/drfv43ng3/image/upload/v1637754868/d4nirgzzpzcjgpdlcrkg.jpg",
  #"https://res.cloudinary.com/drfv43ng3/image/upload/v1637754798/gtuir2cw2leisweuzaus.jpg",
  #"https://res.cloudinary.com/drfv43ng3/image/upload/v1637754571/w0fbmdqboeheahmif62l.jpg",
  #"https://res.cloudinary.com/drfv43ng3/image/upload/v1637756561/ihdkxpsu3byl59y4quca.jpg",
  "https://res.cloudinary.com/drfv43ng3/image/upload/v1637756839/evy5t5zamg1eegofyxrx.jpg"
]

puts 'Creating jams'
for i in 0..6 do
  jam = Jam.new(
    title: titles[i],
    description: Faker::Hipster.sentence,
    user: User.find(User.pluck(:id).sample),
    location: locations[i],
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
  # image = URI.open(urls[i])
  # jam.photo.attach(io: file, filename: "#{i}.jpg", content_type: 'image/jpg')
  jam.save!
end
