require 'rails_helper'
module Mutations
  module UserBooks
    RSpec.describe DestroyUserBook, type: :request do
      describe 'Destroy User' do
        before :each do
          create_list(:user, 3)
          @user_count = User.count
          @deletion_id = User.last.id
        end
        it 'deletes a user' do
          expect(@user_count).to eq(3)
          post '/graphql', params: {query: query}
          expect(User.count).to eq(2)
          json = JSON.parse(response.body)
          data = json['data']['destroyUser']

          expect(data["id"].to_i).to eq(@deletion_id)
        end

      end

      def query
        <<~GQL
          mutation{
            destroyUser(input:{id: "#{@deletion_id}"}){
              id
            }
          }
        GQL
      end
    end
  end
end