User.delete_all
Rant.delete_all

user = User.create!({
  email: 'user@example.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: 'password',
})

Rant.create!({
  user_id: user.id,
  title: Faker::Name.title,
  body: Faker::Lorem.sentence
})
