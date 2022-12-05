# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(name: "Sandy M", zipcode: "80241", email: "sandy@gmail.com")
user_2 = User.create!(name: "Joe B", zipcode: "80020", email: "Bob@gmail.com")

book_1 = Book.create!(google_book_id: "tXGRBgwxAHIC", book_title: "Caliban's War", author: "James S. A. Corey", isbn_13: "9780316202275", condition: "Excellent", genre: "Sci-Fi", book_cover:"http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
book_2 = Book.create!(google_book_id: "aWZzLPhY4o0C", book_title: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn_13: "9780547952017", condition: "Good", genre: "Adventure", book_cover:"http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)
book_3 = Book.create!(google_book_id: "hffZtgAACAAJ", book_title: "A Game of Thrones", author: "George R. R. Martin", isbn_13: "9780007428540", condition: "Good", genre: "Fantasy", book_cover: "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", available: true)
book_4 = Book.create!(google_book_id: "1q_xAwAAQBAJ", book_title: "Oh, the Places You'll Go!", author: "Dr. Seuss", isbn_13: "9780385371988", condition: "Poor", genre: "Childrens Book", book_cover:"http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: true)

UserBook.create!(user_id: user_1.id, book_id: book_1.id, status: 0)
UserBook.create!(user_id: user_1.id, book_id: book_2.id, status: 0)
UserBook.create!(user_id: user_1.id, book_id: book_4.id, status: 1)
UserBook.create!(user_id: user_2.id, book_id: book_3.id, status: 0)

