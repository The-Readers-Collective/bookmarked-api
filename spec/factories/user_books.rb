FactoryBot.define do
  factory :user_book do
    user_id { Faker::Number.number(digits: 10) }
    book_id { Faker::Number.number(digits: 10) }
    status { Faker.random.number(1) }
  end
end
