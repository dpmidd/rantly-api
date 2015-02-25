module ObjectCreationMethods

  def create_user(overrides = {})
    User.create!({
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password_digest: 'password',
    }.merge(overrides))
  end

  def create_rant(overrides = {})
    Rant.create!({
      user_id: create_user,
      title: Faker::Name.title,
      body: Faker::Lorem.sentence
    }.merge(overrides))
  end
end
