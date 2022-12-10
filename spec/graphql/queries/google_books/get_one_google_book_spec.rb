require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'google books by title' do
    it 'will return google book matching google book id', :vcr do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["googleBook"][0]["bookTitle"]).to eq("Rhythm of War")
      expect(result["data"]["googleBook"][0]["googleBookId"]).to eq("QCPBDwAAQBAJ")
      expect(result["data"]["googleBook"][0]["author"]).to eq("Brandon Sanderson")
      expect(result["data"]["googleBook"][0]["isbn13"]).to eq("9781429952040")
      expect(result["data"]["googleBook"][0]["pgCount"]).to eq(1374)
      expect(result["data"]["googleBook"][0]["description"]).to include("An instant #1 New York Times Bestseller")
      
    end

    def query
      <<~GQL
       {
        googleBook(googleBookID: "QCPBDwAAQBAJ") {
          googleBookId
          isbn13
          author
          bookTitle
          bookCover
          pgCount
          description
          category
        }
      }
      GQL
    end
  end

end