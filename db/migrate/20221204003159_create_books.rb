class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :user, foreign_key: true
      t.string :google_book_id
      t.string :book_title
      t.string :author
      t.string :isbn_13
      t.string :condition
      t.string :genre
      t.string :book_cover
      t.integer :status
      
      t.timestamps
    end
  end
end
