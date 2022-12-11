module Types
  class BookAttributes < BaseInputObject
    description "Attributes for creating or updating a Book"
    argument :google_book_id, String, required: false
    argument :isbn_13, String, required: false
    argument :pg_count, Integer, required: false
    argument :description, String, required: false
    argument :author, String, required: false
    argument :book_title, String, required: false
    argument :book_cover, String, required: false
    argument :category, String, required: false
    argument :condition, String, required: false
    argument :available, Boolean, required: false
  end
end