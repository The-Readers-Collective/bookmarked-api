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
end