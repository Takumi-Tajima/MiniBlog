FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name.gsub(/\s+/, '') }
    email { Faker::Internet.unique.email }
    profile { Faker::Lorem.sentence }
    password { 'foobar' }
  end
end
