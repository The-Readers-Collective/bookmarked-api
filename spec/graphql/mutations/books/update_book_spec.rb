require 'rails_helper'

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      describe 'updating a book' do
        before :each do
          @book_1 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        end

        it 'updates the user :happy_path' do
          
          post '/graphql', params: { query: mutation }

          json = JSON.parse(response.body)
          data = json['data']['updateBook']
          expect(data['book']['book_title']).to eq("The Fellowship Of The Ring")
          expect(data['book']['author']).to eq("J.R.R. Tolkien")
          expect(data['book']['isbn_13']).to eq("9780547952017")
        end


                  @book_1 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        def mutation
          <<~GQL
          mutation{
            updateBook(input:{id: "#{@book_1.id}", attributes:{
              google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017"
            }}) {
              user {
                id
                email
                name
                zipcode
              }
            }
          }
          GQL
        end
      end
    end
  end
end