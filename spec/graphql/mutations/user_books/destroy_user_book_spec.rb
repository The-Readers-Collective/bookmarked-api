require 'rails_helper'
module Mutations
  module UserBooks
    RSpec.describe DestroyUserBook, type: :request do
      describe 'Destroy UserBook' do
        before :each do
          @user_1 = create(:user)
          @book_1 = create(:book)

          @user_book_1 = create(:user_book, user_id: @user_1.id, book_id: @book_1.id)

          @user_book_count = UserBook.count
          @deletion_id = UserBook.last.id
        end
        it 'deletes a user' do
          expect(@user_book_count).to eq(1)
          post '/graphql', params: {query: query}
          expect(UserBook.count).to eq(0)
          json = JSON.parse(response.body)
          data = json['data']['destroyUserBook']

          expect(data['id'].to_i).to eq(@deletion_id)
        end
      end

      def query
        <<~GQL
          mutation{
            destroyUserBook(input:{id: "#{@deletion_id}"}){
              id
            }
          }
        GQL
      end
    end
  end
end