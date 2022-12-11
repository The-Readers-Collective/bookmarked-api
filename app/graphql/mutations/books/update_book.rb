class Mutations::Books::UpdateBook < Mutations::BaseMutation
  argument :attributes, Types::BookAttributes
  argument :id, ID, required: true

  field :id, ID, null: true
  field :book, Types::BookType, null: false
  field :errors, [String], null: false

  def resolve(id:, attributes:)
    book = Book.find(id)
    binding.pry
    if book.update(attributes.to_h)
      {
        book: book
      }
    else
      {
        errors: book.errors.full_messages
      }
    end

  end
end

