require 'rails_helper'

RSpec.describe 'Google Books Facade' do
  context 'Happy Path' do
    it 'returns an array of google book objects by title', :vcr do
      books = GoogleBooksFacade.books_by_name("Rhythm of War")

      expect(books).to be_a Array
      expect(books.length).to eq(10)
      expect(books[0]).to be_a GoogleBook
      expect(books[0].google_book_id).to eq("QCPBDwAAQBAJ")
      expect(books[0].book_title).to eq("Rhythm of War")
      expect(books[0].author).to eq("Brandon Sanderson")
      expect(books[0].isbn_13).to eq("9781429952040")
      expect(books[0].category).to eq("Fiction")
      expect(books[0].book_cover).to eq("http://books.google.com/books/content?id=QCPBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")
    end
    it 'returns a google book object by google book id', :vcr do
      book = GoogleBooksFacade.book_by_google_book_id("QCPBDwAAQBAJ")

      expect(book).to be_a GoogleBook
      expect(book.google_book_id).to eq("QCPBDwAAQBAJ")
      expect(book.book_title).to eq("Rhythm of War")
      expect(book.author).to eq("Brandon Sanderson")
      expect(book.isbn_13).to eq("9781429952040")
      expect(book.category).to eq("Fiction")
      expect(book.book_cover).to eq("http://books.google.com/books/content?id=QCPBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")
    end
  end
end