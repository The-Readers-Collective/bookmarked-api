require 'rails_helper'

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      before :each do
        @book_1 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      end

      describe 'updating a book' do

        it 'updates the user :happy_path' do
          
          post '/graphql', params: { query: mutation }

          json = JSON.parse(response.body)
          data = json['data']['updateBook']
          expect(data['book']['bookTitle']).to eq("The Fellowship Of The Ring")
          expect(data['book']['author']).to eq("J.R.R. Tolkien")
          expect(data['book']['isbn13']).to eq("9780547952017")
        end

        def mutation
          <<~GQL
          mutation{
            updateBook(input:{id: "#{@book_1.id}", attributes:{
              googleBookId: "aWZzLPhY4o0C", bookTitle: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn13: "9780547952017", condition: "Good", category: "Adventure", bookCover: "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true
            }}) {
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
          GQL
        end
      end
    end
  end
end