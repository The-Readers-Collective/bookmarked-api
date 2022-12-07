require 'rails_helper'
module Mutations
  module Books
    RSpec.describe DestroyBook, type: :request do
      describe 'Destroy Book' do
        before :each do
          create_list(:book, 3)
          @book_count = Book.count
          @deletion_id = Book.last.id
        end

        it 'deletes a book' do
          expect(@book_count).to eq(3)
          post '/graphql', params: {query: mutation}
          expect(Book.count).to eq(2)
          json = JSON.parse(response.body)
          data = json['data']['destroyBook']

          expect(data["id"].to_i).to eq(@deletion_id)
        end

      end

      def mutation
        <<~GQL
          mutation{
            destroyBook(input:{id: "#{@deletion_id}"}){
              id
            }
          }
        GQL
      end
    end
  end
end