class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :google_book_id
      t.string :book_title
      t.string :author
      t.string :isbn_13
      t.string :condition
      t.string :genre
      t.string :book_cover
      t.boolean :available
      
      t.timestamps
    end
  end
end
