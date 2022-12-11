require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'return all books' do
    before :each do
      @book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", pg_count: 624, description: "The second book in the NYT bestselling Expanse series, Caliban's War shows a solar system on the brink of war, and the only hope of peace rests on James Holden and the crew of the Rocinante's shoulders. Now a Prime Original series. We are not alone. On Ganymede, breadbasket of the outer planets, a Martian marine watches as her platoon is slaughtered by a monstrous supersoldier. On Earth, a high-level politician struggles to prevent interplanetary war from reigniting. And on Venus, an alien protomolecule has overrun the planet, wreaking massive, mysterious changes and threatening to spread out into the solar system. In the vast wilderness of space, James Holden and the crew of the Rocinante have been keeping the peace for the Outer Planets Alliance. When they agree to help a scientist search war-torn Ganymede for a missing child, the future of humanity rests on whether a single ship can prevent an alien invasion that may have already begun . . .", condition: 2, category: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
    end

    it 'will return a book' do
      result = BookmarkedApiSchema.execute(query).as_json
      expect(result["data"]["book"]["bookTitle"]).to eq("Caliban's War")
      expect(result["data"]["book"]["author"]).to eq("James S. A. Corey")
    end

    def query
      <<~GQL
       {
        book(id: "#{@book_1.id}") {
          id
          googleBookId
          isbn13
          pgCount
          description
          author
          bookTitle
          bookCover
          category
          condition
          available
          updatedAt
        }
      }
      GQL
    end

  end
end