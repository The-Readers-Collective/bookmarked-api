class Mutations::UserBooks::CreateUserBook < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :book_id, ID, required: true
  argument :status, Integer, required: true

  field :user_book, Types::UserBookType, null: false
  field :errors, [String], null: false

  def resolve(user_id:, book_id:, status:)
    user_book = UserBook.new(user_id: user_id, book_id: book_id, status: status)
    # binding.pry
    if user_book.save
      {
        user_book: user_book,
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