require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'return all books' do
    before :each do
      @book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", condition: "Excellent", category: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
    end

    it 'will return all users' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["book"][0]["bookTitle"]).to eq("Caliban's War")
      expect(result["data"]["book"][0]["author"]).to eq("James S. A. Corey")
    end

    def query
      <<~GQL
       {
        book(id: "#{@book_1.id}") {
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
      GQL
    end

  end
end