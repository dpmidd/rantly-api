User.delete_all
Rant.delete_all

10.times do

@user = User.create!({
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password_digest: 'password',
})

end

10.times do

Rant.create!({
  user_id: @user.id,
  title: Faker::Name.title,
  body: Faker::Lorem.sentence
})

end
