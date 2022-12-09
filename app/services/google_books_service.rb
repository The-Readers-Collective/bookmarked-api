class GoogleBooksService

  def self.books_by_name(book_name)
    response = conn.get("/books/v1/volumes/") do |req|
      req.params['q'] = "#{book_name}+intitle:#{book_name}"
    end
    parse_body(response)
  end

  def self.book_by_google_book_id(google_book_id)
    response = conn.get("/books/v1/volumes/") do |req|
      req.params['q'] = "#{google_book_id}"
    end
    parse_body(response)
  end

  def self.conn 
    Faraday.new(url: "https://www.googleapis.com",
                params: { key: ENV['google_api_key'] }
    )
  end

  def self.parse_body(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
