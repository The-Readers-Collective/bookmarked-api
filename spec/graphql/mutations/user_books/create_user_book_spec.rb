require 'rails_helper'

module Mutations
  module UserBooks
    RSpec.describe CreateUserBook, type: :request do
      describe '.resolve' do
        before :each do
          @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
          @book_1 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
        end

        it 'creates a userbook' do
          expect(UserBook.count).to eq(0)
          post '/graphql', params: {query: query}
          expect(UserBook.count).to eq(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['createUserBook']
          expect(data['userBook']['userId']).to eq(@user_1.id.to_s)
          expect(data['userBook']['bookId']).to eq(@book_1.id.to_s)
          expect(data['userBook']['status']).to eq(1)
        end

      end

      def query
        <<~GQL
          mutation{
            createUserBook(input:{
              userId: #{@user_1.id},
              bookId: "#{@book_1.id}",
              status: 1
            }){
              userBook {
                id,
                userId,
                bookId,
                status
              }
              errors
            }
          }
        GQL
      end
    end
  end
end