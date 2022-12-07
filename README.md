# Back End Repository for Bookmarked

[Deployed BE Site](https://bookmarked-api.herokuapp.com/graphql)

[Return to Main Page](https://github.com/The-Readers-Collective)

## Table of Contents

1. [Architecture and Design](#architecture-and-design)
2. [Available API End Points](#all-available-api-end-points)
  - [Create User](#create-user)
  - [View All Users](#view-all-users)
  - [View One User](#view-one-user)
  - [Delete User](#delete-user)
  - [Update User](#update-user)
  - [View All Users and their Books](#view-all-users-and-all-books)
  - [View a single User and their Books](#view-a-single-user-and-their-books)
  - [View All Books](#view-all-books)
  - [View One Book](#view-a-single-book)
  - [Create Book](#create-a-book)
  - [Delete Book](#delete-a-book)
  - [Update Book](#update-a-book)
3. [Local Setup](#local-setup)
4. [Versions](#versions)
5. [Contributors](#contributors)


## Architecture and Design

<p align="center">
  <img src="https://github.com/The-Readers-Collective/.github/blob/main/profile/assets/BE_DB_Schema.png?raw=true" />
</p>

## All Available API End Points:

`POST https://bookmarked-api.herokuapp.com/graphql`

**note query params can contain as many or as little fields as you want, adjust query as needed.*

### Create User
Creates a single user

<b>Example Query:</b>
```json
mutation{
  createUser(input:{
   	name: "Florida M.",
    zipcode: "32811",
    email: "florida@man.com"
  }){
    user {
      id,
      name,
      zipcode,
      email
    }
    errors
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "createUser": {
      "user": {
        "id": "3",
        "name": "Florida M.",
        "zipcode": "32811",
        "email": "florida@man.com"
      },
      "errors": []
    }
  }
}
```

### View All Users
Returns all Users

<b>Example Query:</b>
```json
query {
  users {
    id
    email
    name
    zipcode
    updatedAt
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "sandy@gmail.com",
        "name": "Sandy M",
        "zipcode": "80241",
        "updatedAt": "2022-12-06T06:39:38Z"
      },
      {
        "id": "2",
        "email": "Bob@gmail.com",
        "name": "Bob Joe",
        "zipcode": "80020",
        "updatedAt": "2022-12-06T07:23:54Z"
      },
      {
        "id": "3",
        "email": "florida@man.com",
        "name": "Florida M.",
        "zipcode": "32811",
        "updatedAt": "2022-12-06T07:08:36Z"
      }
    ]
  }
}
```

### View One User
Returns a single user

<b>Example Query:</b>
```json
query {
  user(id: 1) {
    id
    email
    name
    zipcode
    updatedAt
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "user": {
      "id": "1",
      "email": "sandy@gmail.com",
      "name": "Sandy M",
      "zipcode": "80241",
      "updatedAt": "2022-12-06T06:39:38Z"
    }
  }
}
```

### Delete User
Deletes a single user

<b>Example Query:</b>
```json
mutation{
  destroyUser(input:{id: "4"}){
    id
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "destroyUser": {
      "id": "4"
    }
  }
}
```

### Update User
Lets you update attributes of a single User

<b>Example Query:</b>
```json
mutation{
  updateUser(input:{id: "2", attributes:{
    name: "Bob Joe", zipcode: "80020", email: "Bob@gmail.com"
  }}) {
    user {
      id
      email
      name
      zipcode
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "updateUser": {
      "user": {
        "id": "2",
        "email": "Bob@gmail.com",
        "name": "Bob Joe",
        "zipcode": "80020"
      }
    }
  }
}
```

### View All Users and All Books
Lets you view all users and all their books

<b>Example Query:</b>
```json
query {
  users {
    id
    email
    name
    zipcode
    updatedAt
    userBooks{
      id
      userId
      bookId
      status
      book {
        id
        googleBookId
        isbn13
        author
        bookTitle
        bookCover
        category
        condition
        available
        updatedAt
      }
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "sandy@gmail.com",
        "name": "Sandy M",
        "zipcode": "80241",
        "updatedAt": "2022-12-06T06:39:38Z",
        "userBooks": [
          {
            "id": "1",
            "userId": "1",
            "bookId": "1",
            "status": 0,
            "book": {
              "id": "1",
              "googleBookId": "tXGRBgwxAHIC",
              "isbn13": "9780316202275",
              "author": "James S. A. Corey",
              "bookTitle": "Caliban's War",
              "bookCover": "http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
              "category": "Sci-Fi",
              "condition": "Excellent",
              "available": true,
              "updatedAt": "2022-12-06T06:39:38Z"
            }
          },
          {
            "id": "2",
            "userId": "1",
            "bookId": "2",
            "status": 0,
            "book": {
              "id": "2",
              "googleBookId": "aWZzLPhY4o0C",
              "isbn13": "9780547952017",
              "author": "J.R.R. Tolkien",
              "bookTitle": "The Fellowship Of The Ring",
              "bookCover": "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
              "category": "Adventure",
              "condition": "Good",
              "available": true,
              "updatedAt": "2022-12-06T06:39:38Z"
            }
          },
          {
            "id": "3",
            "userId": "1",
            "bookId": "4",
            "status": 1,
            "book": {
              "id": "4",
              "googleBookId": "1q_xAwAAQBAJ",
              "isbn13": "9780385371988",
              "author": "Dr. Seuss",
              "bookTitle": "Oh, the Places You'll Go!",
              "bookCover": "http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
              "category": "Childrens Book",
              "condition": "Poor",
              "available": true,
              "updatedAt": "2022-12-06T06:39:38Z"
            }
          }
        ]
      },
      {
        "id": "2",
        "email": "Bob@gmail.com",
        "name": "Joe B",
        "zipcode": "80020",
        "updatedAt": "2022-12-06T06:39:38Z",
        "userBooks": [
          {
            "id": "4",
            "userId": "2",
            "bookId": "3",
            "status": 0,
            "book": {
              "id": "3",
              "googleBookId": "hffZtgAACAAJ",
              "isbn13": "9780007428540",
              "author": "George R. R. Martin",
              "bookTitle": "A Game of Thrones",
              "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
              "category": "Fantasy",
              "condition": "Good",
              "available": true,
              "updatedAt": "2022-12-06T06:39:38Z"
            }
          }
        ]
      }
    ]
  }
}
```

### View A Single User and their Books
Lets you view a single user and all their books

<b>Example Query:</b>
```json
query {
  user(id: 2) {
    id
    email
    name
    zipcode
    updatedAt
    userBooks {
      id
      userId
      bookId
      status
      book {
        id
        isbn13
        bookCover
        bookTitle
        author
        googleBookId
        category
        condition
        available
        updatedAt
      }
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "user": {
      "id": "2",
      "email": "Bob@gmail.com",
      "name": "Bob Joe",
      "zipcode": "80020",
      "updatedAt": "2022-12-06T07:23:54Z",
      "userBooks": [
        {
          "id": "4",
          "userId": "2",
          "bookId": "3",
          "status": 0,
          "book": {
            "id": "3",
            "isbn13": "9780007428540",
            "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
            "bookTitle": "A Game of Thrones",
            "author": "George R. R. Martin",
            "googleBookId": "hffZtgAACAAJ",
            "category": "Fantasy",
            "condition": "Good",
            "available": true,
            "updatedAt": "2022-12-06T06:39:38Z"
          }
        }
      ]
    }
  }
}
```
### View All Books
Lets you view all books

<b>Example Query:</b>
```json
query{
  books {
    id
    googleBookId
    isbn13
    author
    bookTitle
    bookCover
    category
    condition
    available
    updatedAt
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "books": [
      {
        "id": "1",
        "googleBookId": "tXGRBgwxAHIC",
        "isbn13": "9780316202275",
        "author": "James S. A. Corey",
        "bookTitle": "Caliban's War",
        "bookCover": "http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "category": "Sci-Fi",
        "condition": "Excellent",
        "available": true,
        "updatedAt": "2022-12-07T18:09:33Z"
      },
      {
        "id": "2",
        "googleBookId": "aWZzLPhY4o0C",
        "isbn13": "9780547952017",
        "author": "J.R.R. Tolkien",
        "bookTitle": "The Fellowship Of The Ring",
        "bookCover": "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "category": "Adventure",
        "condition": "Good",
        "available": true,
        "updatedAt": "2022-12-07T18:09:33Z"
      },
      {
        "id": "3",
        "googleBookId": "hffZtgAACAAJ",
        "isbn13": "9780007428540",
        "author": "George R. R. Martin",
        "bookTitle": "A Game of Thrones",
        "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "category": "Fantasy",
        "condition": "Good",
        "available": true,
        "updatedAt": "2022-12-07T18:09:33Z"
      },
      {
        "id": "4",
        "googleBookId": "1q_xAwAAQBAJ",
        "isbn13": "9780385371988",
        "author": "Dr. Seuss",
        "bookTitle": "Oh, the Places You'll Go!",
        "bookCover": "http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "category": "Childrens Book",
        "condition": "Poor",
        "available": true,
        "updatedAt": "2022-12-07T18:09:33Z"
      }
    ]
  }
}
```

### View a single Book
Lets you view a single particular book

<b>Example Query:</b>
```json
query{
  book(id:"1") {
    id
    googleBookId
    isbn13
    author
    bookTitle
    bookCover
    category
    condition
    available
    updatedAt
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "book": {
      "id": "1",
      "googleBookId": "tXGRBgwxAHIC",
      "isbn13": "9780316202275",
      "author": "James S. A. Corey",
      "bookTitle": "Caliban's War",
      "bookCover": "http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
      "category": "Sci-Fi",
      "condition": "Excellent",
      "available": true,
      "updatedAt": "2022-12-07T18:09:33Z"
    }
  }
}
```

### Create a Book
Lets you create a Book

<b>Example Query:</b>
```json
mutation{
  createBook(input:{
      googleBookId: "E-kdBQAAQBAJ"
      isbn13: "9781619634459"
      author: "Sarah J. Maas"
      bookTitle: "A Court of Thorns and Roses"
      bookCover: "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
      category: "Fiction"
      condition: "Excellent"
      available: true
    }){
    book {
      id,
      googleBookId,
      isbn13,
      author,
      bookTitle,
      bookCover,
      category,
      condition,
      available,
      updatedAt
    }
    errors
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "createBook": {
      "book": {
        "id": "5",
        "googleBookId": "E-kdBQAAQBAJ",
        "isbn13": "9781619634459",
        "author": "Sarah J. Maas",
        "bookTitle": "A Court of Thorns and Roses",
        "bookCover": "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "category": "Fiction",
        "condition": "Excellent",
        "available": true,
        "updatedAt": "2022-12-07T18:45:16Z"
      },
      "errors": []
    }
  }
}
```

### Delete a Book
Lets you delete a Book

<b>Example Query:</b>
```json
mutation{
  destroyBook(input:{id: "5"}){
    id
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "destroyBook": {
      "id": "5"
    }
  }
}
```

### Update a Book
Lets you update a Books attributes

<b>Example Query:</b>
```json
mutation{
  updateBook(input:{id: "2", attributes:{
    googleBookId: "aWZzLPhY4o0C", bookTitle: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", isbn13: "9780547952017", condition: "Good", category: "Adventure", bookCover: "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: false
  }}) {
    book {
      id
      googleBookId
      isbn13
      author
      bookTitle
      bookCover
      category
      condition
      available
      updatedAt
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "updateBook": {
      "book": {
        "id": "2",
        "googleBookId": "aWZzLPhY4o0C",
        "isbn13": "9780547952017",
        "author": "J.R.R. Tolkien",
        "bookTitle": "The Fellowship Of The Ring",
        "bookCover": "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "category": "Adventure",
        "condition": "Good",
        "available": false,
        "updatedAt": "2022-12-07T18:52:11Z"
      }
    }
  }
}
```
## Local Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate,seed}`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Versions

- Ruby 2.7.4

- Rails 5.2.8

## Contributors


<img src="https://avatars.githubusercontent.com/u/16805645?s=120&v=4" />

Jake K | [Github](https://github.com/LlamaBack) | [LinkedIn](https://www.linkedin.com/in/jake-k-5413a6227/) |


<img src="https://avatars.githubusercontent.com/u/102932532?s=120&v=4" />

Sunny Moore | [Github](https://github.com/sunny-moore) | [LinkedIn](https://www.linkedin.com/in/sunny-moore/) |


<img src="https://avatars.githubusercontent.com/u/59062958?s=120&v=4" />

Sandy M Griffin | [Github](https://github.com/SandyyMarie) | [LinkedIn](https://www.linkedin.com/in/sandy-marie/) |

##

[Back To Top](#back-end-repository-for-bookmarked) 
