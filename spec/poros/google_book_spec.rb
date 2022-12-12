require 'rails_helper'

RSpec.describe 'Google Book Poro' do
  context 'Happy Path' do
    it 'exists and has attributes' do
      response = File.read("spec/fixtures/book_data.json")

      books_data = JSON.parse(response, symbolize_names: true)
      one_book = books_data[:items][0]

      book = GoogleBook.new(one_book)

      expect(book).to be_a GoogleBook
      expect(book.google_book_id).to be_a String
      expect(book.google_book_id).to eq("QCPBDwAAQBAJ")
      expect(book.book_title).to be_a String
      expect(book.book_title).to eq("Rhythm of War")
      expect(book.author).to be_a String
      expect(book.author).to eq("Brandon Sanderson")
      expect(book.isbn_13).to be_a String
      expect(book.isbn_13).to eq("9781429952040")
      expect(book.pg_count).to be_a Integer
      expect(book.pg_count).to eq(1374)
      expect(book.description).to be_a String
      expect(book.description).to include("An instant #1 New York Times Bestseller and a USA Today")
      expect(book.category).to be_a String
      expect(book.category).to eq("Fiction")
      expect(book.book_cover).to be_a String
      expect(book.book_cover).to eq("http://books.google.com/books/content?id=QCPBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")

    end
  end
  context 'Sad Path' do
    it 'concatenates an array of categories into one string' do
      response = File.read("spec/fixtures/book_data_sad_path.json")

      books_data = JSON.parse(response, symbolize_names: true)
      one_book = books_data[:items][0]

      book = GoogleBook.new(one_book)

      expect(book).to be_a GoogleBook
      expect(book.category).to be_a String
      expect(book.category).to eq("Fiction, Fantasy")
      
    end
    it 'concatenates an array of authors into one string' do
        response = File.read("spec/fixtures/book_data_sad_path.json")

      books_data = JSON.parse(response, symbolize_names: true)
      one_book = books_data[:items][0]

      book = GoogleBook.new(one_book)

      expect(book).to be_a GoogleBook
    
      expect(book.author).to be_a String
      expect(book.author).to eq("Brandon Sanderson, Test Author")
      
    end
  end
end