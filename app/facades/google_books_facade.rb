class GoogleBooksFacade
  def self.books_by_name(book_name)
    books = GoogleBooksService.books_by_name(book_name)
    if books[:items]
      books[:items].map do |book_data|
        GoogleBook.new(book_data)
      end
    else
      []
    end
  end

  def self.book_by_google_book_id(google_book_id)
    books = GoogleBooksService.book_by_google_book_id(google_book_id)
    if books[:items]
      GoogleBook.new(books[:items][0])
    else
      []
    end
  end
end