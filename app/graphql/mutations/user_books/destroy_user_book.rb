class Mutations::UserBooks::DestroyUserBook < Mutations::BaseMutation
  argument :id, ID, required: true

  field :id, ID, null: true
  field :user_book, Types::UserBookType, null: false

  def resolve(id:)
    user_book = UserBook.find(id)
    user_book.destroy
    {
      id: id
    }
  end
end