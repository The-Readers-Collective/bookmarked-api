FactoryBot.define do
  factory :book do
    google_book_id { Faker::Number.number(digits: 10) }
    book_title { Faker::Book.title }
    author { Faker::Book.author }
    isbn_13 { Faker::Number.number(digits: 10) }
    pg_count { Faker::Number.number(digits: 3) }
    description { Faker::Books::Dune.quote }
    condition { "Good" }
    category { "Adventure" }
    book_cover { Faker::Internet.domain_name }
    available { true }
  end
end
