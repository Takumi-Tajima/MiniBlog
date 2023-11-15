FactoryBot.define do
  factory :user do
    name { 'aaa' }
    email { Faker::Internet.unique.email }
    profile { Faker::Lorem.sentence }
    password { 'foobar' }
  end
end
