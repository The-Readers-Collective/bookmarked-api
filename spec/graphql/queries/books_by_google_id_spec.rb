require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'returns all books of same google book id' do
    before :each do
        @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
        @book_1 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: 0, category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        @book_2 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: 2, category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: false)
        @book_3 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: 1, category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        UserBook.create!(user_id: @user_1.id, book_id: @book_1.id, status: 0)
        UserBook.create!(user_id: @user_1.id, book_id: @book_2.id, status: 0)
        UserBook.create!(user_id: @user_1.id, book_id: @book_3.id, status: 0)
    end

    it 'returns books of same google book id' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["booksByGoogleBookId"].size).to eq(3)
      expect(result["data"]["booksByGoogleBookId"][2]["googleBookId"]).to eq("1q_xAwAAQBAJ")
    end

    def query
      <<~GQL
       {
        booksByGoogleBookId(googleBookId: "#{@book_1.google_book_id}") {
          id
          bookTitle
          isbn13
          author
          googleBookId
        }
      }
      GQL
    end
  end
end