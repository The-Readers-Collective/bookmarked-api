require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'will show a user' do
    before :each do
      @user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
    end

    it ' a single user' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["user"]["email"]).to eq("sandy@gmail.com")
      expect(result["data"]["user"]["name"]).to eq("Sandy M")
      expect(result["data"]["user"]["zipcode"]).to eq("80241")
    end

    def query
      <<~GQL
       {
        user(id: "#{@user_1.id}") {
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