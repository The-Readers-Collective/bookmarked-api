require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe 'updating users' do
        before :each do
          @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
        end

        it 'updates the user' do
          
          post '/graphql', params: { query: query }

          json = JSON.parse(response.body)
          data = json['data']['updateUser']
          expect(data['user']['name']).to eq("Bob Joe")
          expect(data['user']['zipcode']).to eq("80020")
          expect(data['user']['email']).to eq("Bob@gmail.com")
        end

        def query
          <<~GQL
          mutation{
            updateUser(input:{id: "#{@user_1.id}", attributes:{
              name: "Bob Joe", zipcode: "80020", email: "Bob@gmail.com"
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