users = []

30.times do |n|
  name = Faker::Name.unique.name.gsub(/\s+/, '')  # スペースを削除
  email = Faker::Internet.unique.email
  profile = Faker::Lorem.sentence
  password = "foobarpassword"

  users << User.new(
    name: name,
    email: email,
    profile: profile,
    password: password
  )
end

User.import users
