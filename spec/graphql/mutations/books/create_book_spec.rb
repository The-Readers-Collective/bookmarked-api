require 'rails_helper'

module Mutations
  module Books
    RSpec.describe CreateBook, type: :request do
      before :each do 
        @user_1 = User.create!(name: "Tester 1", zipcode: "80241", email: "test1@gmail.com")
      end
      context 'book creation, happy path' do
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
      context 'book creation, sad path' do
        it 'returns errors if missing fields' do
          expect(Book.count).to eq(0)
          post '/graphql', params: { query: query2 }
          expect(Book.count).to eq(0)
          json = JSON.parse(response.body)
          expect(json.keys).to include("errors")
          expect(json["errors"][0]).to include("message", "locations", "path", "extensions")
          expect(json["errors"][0]["message"]).to eq("Argument 'googleBookId' on InputObject 'CreateBookInput' is required. Expected type String!")
        end
      end

      def query
        <<~GQL
          mutation{
            createBook(input:{
                googleBookId: "E-kdBQAAQBAJ"
                isbn13: "9781619634459"
                pgCount: 432
                description: "The sexy, action-packed first book in the #1 New York Times bestselling Court of Thorns and Roses series from Sarah J. Maas. When nineteen-year-old huntress Feyre kills a wolf in the woods, a terrifying creature arrives to demand retribution. Dragged to a treacherous magical land she knows about only from legends, Feyre discovers that her captor is not truly a beast, but one of the lethal, immortal faeries who once ruled her world. At least, he's not a beast all the time. As she adapts to her new home, her feelings for the faerie, Tamlin, transform from icy hostility into a fiery passion that burns through every lie she's been told about the beautiful, dangerous world of the Fae. But something is not right in the faerie lands. An ancient, wicked shadow is growing, and Feyre must find a way to stop it, or doom Tamlin-and his world-forever. From bestselling author Sarah J. Maas comes a seductive, breathtaking book that blends romance, adventure, and faerie lore into an unforgettable read."
                author: "Sarah J. Maas"
                bookTitle: "A Court of Thorns and Roses"
                bookCover: "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                category: "Fiction"
                condition: "EXCELLENT"
                available: true
                userId: #{@user_1.id}
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
      def query2
        <<~GQL
          mutation{
            createBook(input:{
                description: "The sexy, action-packed first book in the #1 New York Times bestselling Court of Thorns and Roses series from Sarah J. Maas. When nineteen-year-old huntress Feyre kills a wolf in the woods, a terrifying creature arrives to demand retribution. Dragged to a treacherous magical land she knows about only from legends, Feyre discovers that her captor is not truly a beast, but one of the lethal, immortal faeries who once ruled her world. At least, he's not a beast all the time. As she adapts to her new home, her feelings for the faerie, Tamlin, transform from icy hostility into a fiery passion that burns through every lie she's been told about the beautiful, dangerous world of the Fae. But something is not right in the faerie lands. An ancient, wicked shadow is growing, and Feyre must find a way to stop it, or doom Tamlin-and his world-forever. From bestselling author Sarah J. Maas comes a seductive, breathtaking book that blends romance, adventure, and faerie lore into an unforgettable read."
                author: "Sarah J. Maas"
                bookTitle: "A Court of Thorns and Roses"
                bookCover: "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                category: "Fiction"
                condition: "EXCELLENT"
                available: true
                userId: #{@user_1.id}
              }){
              book {
                id,
                bookTitle,
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

