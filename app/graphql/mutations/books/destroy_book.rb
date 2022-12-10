class Mutations::Books::DestroyBook < Mutations::BaseMutation
  argument :id, ID, required: true

  field :id, ID, null: true
  field :book, Types::BookType, null: false

  def resolve(id:)
    book = Book.find(id)
    UserBook.where(book_id: book.id).destroy_all
    book.destroy
    {
      id: id
    }
  end
end