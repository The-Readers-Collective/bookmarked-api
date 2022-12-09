require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'returns users owned books or bookmarked books' do
    before :each do
        @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
        @book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", condition: "Excellent", category: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        @book_2 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        @book_3 = Book.create!(google_book_id: "hffZtgAACAAJ", book_title: "A Game of Thrones", author: "George R. R. Martin", isbn_13: "9780007428540", condition: "Good", category: "Fantasy", book_cover: "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", available: true)
        @book_4 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: "Poor", category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        UserBook.create!(user_id: @user_1.id, book_id: @book_1.id, status: 0)
        UserBook.create!(user_id: @user_1.id, book_id: @book_2.id, status: 0)
        UserBook.create!(user_id: @user_1.id, book_id: @book_3.id, status: 1)
        UserBook.create!(user_id: @user_1.id, book_id: @book_4.id, status: 1)
      end

    it 'will return users owned books' do
      result = BookmarkedApiSchema.execute(owned_books).as_json
      expect(result["data"]["user"]["allOwnedBooks"][0]['googleBookId']).to eq("tXGRBgwxAHIC")
      expect(result["data"]["user"]["allOwnedBooks"][0]["bookTitle"]).to eq("Caliban's War")
      expect(result["data"]["user"]["allOwnedBooks"][1]['googleBookId']).to eq("aWZzLPhY4o0C")
      expect(result["data"]["user"]["allOwnedBooks"][1]["bookTitle"]).to eq("The Fellowship Of The Ring")
    end

    def owned_books
      <<~GQL
       {
        user(id: #{@user_1.id}) {
          allOwnedBooks {
            id
            bookTitle
            googleBookId
          }
        }
      }
      GQL
    end

    it 'will return users bookmarked books' do
      result = BookmarkedApiSchema.execute(bookmarked_books).as_json
      expect(result["data"]["user"]["allBookmarkedBooks"][0]['googleBookId']).to eq("hffZtgAACAAJ")
      expect(result["data"]["user"]["allBookmarkedBooks"][0]["bookTitle"]).to eq("A Game of Thrones")
      expect(result["data"]["user"]["allBookmarkedBooks"][1]['googleBookId']).to eq("1q_xAwAAQBAJ")
      expect(result["data"]["user"]["allBookmarkedBooks"][1]["bookTitle"]).to eq("Oh, the Places You'll Go!")
    end

    def bookmarked_books
      <<~GQL
       {
        user(id: #{@user_1.id}) {
          allBookmarkedBooks {
            id
            bookTitle
            googleBookId
          }
        }
      }
      GQL
    end
  end
end