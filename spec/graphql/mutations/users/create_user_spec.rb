require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        it 'creates a user' do
          expect(User.count).to eq(0)
          post '/graphql', params: {query: query}
          expect(User.count).to eq(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']["createUser"]
          expect(data['user']['name']).to eq('Florida M.')
          expect(data['user']['zipcode']).to eq('32811')
          expect(data['user']['email']).to eq('florida@man.com')
        end

      end

      def query
        <<~GQL
          mutation{
            createUser(input:{
              name: "Florida M.",
              zipcode: "32811",
              email: "florida@man.com"
            }){
              user {
                id,
                name,
                zipcode,
                email
              }
              errors
            }
          }
        GQL
      end
    end
  end
end