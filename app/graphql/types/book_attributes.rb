module Types
  class BookAttributes < BaseInputObject
    description "Attributes for creating or updating a Book"
    argument :google_book_id, String, required: true
    argument :isbn_13, String, required: true
    argument :pg_count, Integer, required: true
    argument :description, String, required: true
    argument :author, String, required: true
    argument :book_title, String, required: true
    argument :book_cover, String, required: true
    argument :category, String, required: true
    argument :condition, Integer, required: true
    argument :available, Boolean, required: true
  end
end