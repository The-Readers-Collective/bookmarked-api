class Mutations::Books::CreateBook < Mutations::BaseMutation
  argument :google_book_id, String, required: true
  argument :isbn_13, String, required: true
  argument :author, String, required: true
  argument :book_title, String, required: true
  argument :book_cover, String, required: true
  argument :category, String, required: true
  argument :condition, String, required: true
  argument :available, Boolean, required: true

  field :book, Types::BookType, null: false
  field :errors, [String], null: false

  def resolve(google_book_id:, isbn_13:, author:, book_title:, book_cover:, category:, condition:, available:)
    book = Book.new(google_book_id: google_book_id, isbn_13: isbn_13, book_title: book_title, author: author, book_cover: book_cover, category: category, condition: condition, available: available)

    if book.save
      {
        book: book,
        errors: []
      }
    else
      {
        book: nil, 
        errors: book.errors.full_messages
      }
    end
  end
end