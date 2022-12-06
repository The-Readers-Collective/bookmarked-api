FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    zipcode { Faker::Address.zip_code }
    email { Faker::Internet.email }
  end
end
