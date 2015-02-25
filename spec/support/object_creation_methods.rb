def create_user(overrides = {})

  User.create!({
    email: Faker::Internet.email
    first_name: Faker::Name.first_name
    last_name: Faker::Name.last_name
  }.merge(overrides))
end
