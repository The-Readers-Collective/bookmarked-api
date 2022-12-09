require 'rails_helper'

RSpec.describe 'Google Books Service' do
  context 'Happy Path' do
    it 'returns books by book name', :vcr do
      search = GoogleBooksService.books_by_name('Rhythm of War')
      
      expect(search).to be_a Hash
      expect(search[:items]).to be_a Array

      item_data = search[:items].first

      expect(item_data.keys).to include(:kind, :id, :volumeInfo)
      expect(item_data[:id]).to be_a String
      expect(item_data[:volumeInfo]).to be_a Hash
      expect(item_data[:volumeInfo].keys).to include(:title, :authors)
      expect(item_data[:volumeInfo][:title]).to be_a String
      expect(item_data[:volumeInfo][:authors]).to be_a Array
      expect(item_data[:volumeInfo][:authors][0]).to be_a String

    end
    it 'returns books by google book id', :vcr do
      search = GoogleBooksService.book_by_google_book_id('QCPBDwAAQBAJ')
      
      expect(search).to be_a Hash
      expect(search[:items]).to be_a Array

      item_data = search[:items].first

      expect(item_data.keys).to include(:kind, :id, :volumeInfo)
      expect(item_data[:id]).to be_a String
      expect(item_data[:volumeInfo]).to be_a Hash
      expect(item_data[:volumeInfo].keys).to include(:title, :authors)
      expect(item_data[:volumeInfo][:title]).to be_a String
      expect(item_data[:volumeInfo][:authors]).to be_a Array
      expect(item_data[:volumeInfo][:authors][0]).to be_a String
    end
    
  end
end