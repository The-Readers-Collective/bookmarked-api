require 'rails_helper'

module Mutations
  module Books
    RSpec.describe CreateBook, type: :request do
      describe 'book creation' do
        it 'creates and returns a book' do
          expect(Book.count).to eq(0)
          post '/graphql', params: { query: query }
          expect(Book.count).to eq(1)
          json = JSON.parse(response.body)
          data = json['data']["createBook"]
          expect(data['book']['bookTitle']).to eq("A Court of Thorns and Roses")
          expect(data['book']['bookCover']).to eq("http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")
          expect(data['book']['isbn13']).to eq("9781619634459")
        end

      end

      def query
        <<~GQL
          mutation{
            createBook(input:{
                googleBookId: "E-kdBQAAQBAJ"
                isbn13: "9781619634459"
                author: "Sarah J. Maas"
                bookTitle: "A Court of Thorns and Roses"
                bookCover: "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                category: "Fiction"
                condition: "Excellent"
                available: true
              }){
              book {
                id,
                googleBookId,
                isbn13,
                author,
                bookTitle,
                bookCover,
                category,
                condition,
                available,
                updatedAt
              }
              errors
            }
          }
        GQL
      end
    end
  end
end