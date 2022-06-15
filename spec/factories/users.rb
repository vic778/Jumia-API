FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
  end
end
