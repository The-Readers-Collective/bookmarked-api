FactoryBot.define do
  factory :book do
    google_book_id { Faker::Number.number(digits: 10) }
    book_title { Faker::Book.title }
    author { Faker::Book.author }
    isbn_13 { Faker::Number.number(digits: 10) }
    status { 1 }
    condition { "Good" }
    category { "Adventure" }
    book_cover { Faker::Internet.domain_name }
    available { true }
  end
end
