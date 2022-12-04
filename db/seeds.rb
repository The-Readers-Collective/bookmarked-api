# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(name: "Sandy M", address: "123 abc st", email: "sandy@gmail.com", password: "abc123")
user_1.books.create!(google_book_id: "123456", book_title: "Sandys Book 1", author: "Sandy L", isbn_13: "1234", condition: "new", genre: "adventure", book_cover:"book_image.jpeg", status: 0)
user_1.books.create!(google_book_id: "654321", book_title: "Sandys Book 2", author: "Sandy L", isbn_13: "5678", condition: "used", genre: "romance", book_cover:"book_image1.jpeg", status: 0)
user_1.books.create!(google_book_id: "2341661", book_title: "Sandys Book 3", author: "Christine J", isbn_13: "9868", condition: "new", genre: "comedy", book_cover:"book_image2.jpeg", status: 1)



user_2 = User.create!(name: "Joe B", address: "578 Elms St", email: "Bob@gmail.com", password: "123abc")
user_2.books.create!(google_book_id: "555888", book_title: "Game of Thrones", author: "GRRM", isbn_13: "8888", condition: "new", genre: "fantasy", book_cover:"book_image5.jpeg", status: 0)


user_1.followings.create!(user_id: user_1.id, followed_id: user_2.id)
##need follower relations
# user_1.books.create!(google_book_id: "555888", book_title: "Game of Thrones", author: "GRRM", isbn_13: "8888", condition: "new", genre: "fantasy", book_cover:"book_image5.jpeg", status: 1)