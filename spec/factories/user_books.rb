FactoryBot.define do
  factory :user_book do
    user_id { Faker::Number.between(from: 0, to: 2) }
    book_id { Faker::Number.between(from: 0, to: 2) }
    status { Faker::Number.between(from: 0, to: 1) }
  end
end
