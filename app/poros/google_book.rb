class GoogleBook
  attr_reader :google_book_id,
              :book_title,
              :author,
              :isbn_13,
              :category,
              :book_cover

  def initialize(book_data)
    @google_book_id = book_data[:id]
    @book_title = book_data[:volumeInfo][:title]
    @author = book_data[:volumeInfo][:authors].join(", ")
    @isbn_13 = book_data[:volumeInfo][:industryIdentifiers][0][:identifier]
    @category = book_data[:volumeInfo][:categories].join(", ") if book_data[:volumeInfo][:categories].present?
    @book_cover = book_data[:volumeInfo][:imageLinks][:thumbnail] if book_data[:volumeInfo][:imageLinks].present?
  end
end