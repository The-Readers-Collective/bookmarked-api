require 'rails_helper'

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      before :each do
        @book_1 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", pg_count: 638, description: "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.", condition: "Good", category: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
      end

      describe 'updating a book' do

        it 'updates the user :happy_path' do
          
          post '/graphql', params: { query: mutation }

          json = JSON.parse(response.body)
          data = json['data']['updateBook']
          expect(data['book']['bookTitle']).to eq("The Fellowship Of The Ring")
          expect(data['book']['author']).to eq("J.R.R. Tolkien")
          expect(data['book']['isbn13']).to eq("9780547952017")
        end

        def mutation
          <<~GQL
          mutation{
            updateBook(input:{id: "#{@book_1.id}", attributes:{
              googleBookId: "aWZzLPhY4o0C", bookTitle: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn13: "9780547952017", 
              pgCount: 638
              description: "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose."
              condition: "Good", category: "Adventure", bookCover: "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true
            }}) {
              book {
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
          }
          GQL
        end
      end
    end
  end
end