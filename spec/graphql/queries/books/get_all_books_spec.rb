require 'rails_helper'

RSpec.describe Types::QueryType do
  before :each do
      @book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", pg_count: 624, description: "The second book in the NYT bestselling Expanse series, Caliban's War shows a solar system on the brink of war, and the only hope of peace rests on James Holden and the crew of the Rocinante's shoulders. Now a Prime Original series. We are not alone. On Ganymede, breadbasket of the outer planets, a Martian marine watches as her platoon is slaughtered by a monstrous supersoldier. On Earth, a high-level politician struggles to prevent interplanetary war from reigniting. And on Venus, an alien protomolecule has overrun the planet, wreaking massive, mysterious changes and threatening to spread out into the solar system. In the vast wilderness of space, James Holden and the crew of the Rocinante have been keeping the peace for the Outer Planets Alliance. When they agree to help a scientist search war-torn Ganymede for a missing child, the future of humanity rests on whether a single ship can prevent an alien invasion that may have already begun . . .", condition: 2, category: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      @book_2 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", pg_count: 638, description: "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.", condition: 1, category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      @book_3 = Book.create!(google_book_id: "hffZtgAACAAJ", book_title: "A Game of Thrones", author: "George R. R. Martin", isbn_13: "9780007428540", pg_count: 864, description: "A NEW ORIGINAL SERIES, NOW ON HBO. Here is the first volume in George R. R. Martin's magnificent cycle of novels that includes \"A Clash of Kings\" and \"A Storm of Swords.\" As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin's stunning series is destined to stand as one of the great achievements of imaginative fiction. A GAME OF THRONES Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom's protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones. \"From the Paperback edition.\"", condition: 1, category: "Fantasy", book_cover: "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", available: true)
      @book_4 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", pg_count: 56, description: "A perennial favorite, Dr. Seuss’s wonderfully wise graduation speech is the perfect send-off for children starting out in the world, be they nursery school, high school, or college grads! From soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life’s ups and downs with his trademark humorous verse and illustrations, while encouraging readers to find the success that lies within. In a starred review, Booklist notes: “Seuss’s message is simple but never sappy: life may be a ‘Great Balancing Act,’ but through it all ‘There’s fun to be done.’” This Read & Listen edition contains audio narration.", condition: 0, category: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
    end
  context 'happy path' do
    it 'will return all books' do
      result = BookmarkedApiSchema.execute(query).as_json

      expect(result["data"]["books"][0]["bookTitle"]).to eq("Caliban's War")
      expect(result["data"]["books"][1]["bookTitle"]).to eq("The Fellowship Of The Ring")
    end

    def query
      <<~GQL
       {
        books {
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
  context 'sad path' do
    it 'returns an error if an unknown field is sent' do
      result = BookmarkedApiSchema.execute(query2).as_json

      expect(result["errors"]).to_not eq({})
      expect(result["errors"]).to be_a Array
      expect(result["errors"][0]["message"]).to eq("Field 'categories' doesn't exist on type 'Book'")
      expect(result["errors"][0].keys).to include("locations", "path", "extensions")

      
    end
    def query2
        <<~GQL
        {
        books {
        id
        categories
        }
        }
        GQL
      end
  end
end