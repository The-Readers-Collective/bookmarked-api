require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'return all users and all their books' do
    before :each do
      @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
      @user_2 = User.create!(name: "Joe B", zipcode: "80020", email: "Bob@gmail.com")
      @book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", condition: "Excellent", category: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      @book_2 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      @book_3 = Book.create!(google_book_id: "hffZtgAACAAJ", book_title: "A Game of Thrones", author: "George R. R. Martin", isbn_13: "9780007428540", condition: "Good", category: "Fantasy", book_cover: "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", available: true)
      @book_4 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: "Poor", category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
    end

    it 'will return all users and all their books' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["users"][0]["email"]).to eq("sandy@gmail.com")
      expect(result["data"]["users"][1]["email"]).to eq("Bob@gmail.com")
    end

    def query
      <<~GQL
       {
        users {
          id
          email
          name
          zipcode
          updatedAt
          userBooks{
            id
            userId
            bookId
            status
            book {
              id
              googleBookId
              isbn13
              author
              bookTitle
              bookCover
              category
              condition
              available
              updatedAt
            }
          }
        }
      }
      GQL
    end

  end
end