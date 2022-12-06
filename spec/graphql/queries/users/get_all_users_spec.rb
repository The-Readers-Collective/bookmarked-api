require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'return all users' do
    before :each do
      @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
      @user_2 = User.create!(name: "Joe B", zipcode: "80020", email: "Bob@gmail.com")
    end

    it 'will return all users' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["users"][0]["email"]).to eq("sandy@gmail.com")
      expect(result["data"]["users"][1]["email"]).to eq("Bob@gmail.com")
    end

    def query
      <<~GQL
       {
        users {
          id
          email
          name
          zipcode
          updatedAt
        }
      }
      GQL
    end

  end
end