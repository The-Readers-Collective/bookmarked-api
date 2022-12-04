FactoryBot.define do
  factory :book do
    user { nil }
    google_book_id { "MyString" }
    book_title { "MyString" }
    author { "MyString" }
    isbn_13 { "MyString" }
    status { 1 }
    condition { "MyString" }
    genre { "MyString" }
    book_cover { "MyString" }
  end
end
