# Back End Repository for Bookmarked

[Return to Main Page](https://github.com/The-Readers-Collective)

## Table of Contents

1. [Architecture and Design](#architecture-and-design)
2. [Available API End Points](#all-available-api-end-points)
  - [Create User](#create-user)
  - [All Users](#all-users)
  - [One User](#one-user)
  - [Delete User](#delete-user)
  - [Update User](#update-user)
  - [View Users Books](#view-users-books)
3. [Local Setup](#local-setup)
4. [Versions](#versions)
5. [Contributors](#contributors)


## Architecture and Design

TBD

## All Available API End Points:

`http://localhost:3000/graphiql`

**note query params can contain as many or as little fields as you want, adjust query as needed.*

### Create User
Creates a single user

<b>Example Query:</b>
```json
mutation{
  createUser(input:{
   	name: "Sandy M",
    address: "123 abc st",
    email: "sandy@gmail.com",
    password: "abc123"
  }){
    user {
      id,
      name,
      address,
      email,
      password
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
        "id": "1",
        "name": "Sandy M",
        "address": "123 abc st",
        "email": "sandy@gmail.com",
        "password": "abc123"
      },
      "errors": []
    }
  }
}
```

### All Users
Returns all Users

<b>Example Query:</b>
```json
query {
  users {
    id
    name
    address
    email
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
        "name": "Sandy M",
        "address": "123 abc st",
        "email": "sandy@gmail.com"
      },
      {
        "id": "2",
        "name": "Joe B",
        "address": "578 Elms St",
        "email": "Bob@gmail.com"
      },
      {
        "id": "3",
        "name": "Practice_user",
        "address": "543 Fillet St",
        "email": "Practice@gmail.com"
      }
    ]
  }
}
```

### One User
Returns a single user

<b>Example Query:</b>
```json
query{
  user(id: 1){
    name
    address
    email
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "user": {
      "name": "Sandy M",
      "address": "123 abc st",
      "email": "sandy@gmail.com"
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
Lets you update attributes of a User

<b>Example Query:</b>
```json
mutation{
  updateUser(input:{id: "2", attributes:{
    name: "Bob Joe", address: "578 Elms St", email: "Bob@gmail.com", password: "abc123"
  }}) {
    user {
      id
      name
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
        "name": "Bob Joe"
      }
    }
  }
}
```

### View Users Books
Lets you update attributes of a User

<b>Example Query:</b>
```json
query {
  users {
    id
    name
    email
    address
    books {
      googleBookId
      bookTitle
      author
      isbn13
      genre
      condition
      bookCover
      status
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
        "name": "Sandy M",
        "email": "sandy@gmail.com",
        "address": "123 abc st",
        "books": [
          {
            "googleBookId": "123456",
            "bookTitle": "Sandys Book 1",
            "author": "Sandy L",
            "isbn13": "1234",
            "genre": "adventure",
            "condition": "new",
            "bookCover": "book_image.jpeg",
            "status": 0
          },
          {
            "googleBookId": "654321",
            "bookTitle": "Sandys Book 2",
            "author": "Sandy L",
            "isbn13": "5678",
            "genre": "romance",
            "condition": "used",
            "bookCover": "book_image1.jpeg",
            "status": 0
          },
          {
            "googleBookId": "2341661",
            "bookTitle": "Sandys Book 3",
            "author": "Christine J",
            "isbn13": "9868",
            "genre": "comedy",
            "condition": "new",
            "bookCover": "book_image2.jpeg",
            "status": 1
          }
        ]
      },
      {
        "id": "2",
        "name": "Bob Joe",
        "email": "Bob@gmail.com",
        "address": "578 Elms St",
        "books": [
          {
            "googleBookId": "555888",
            "bookTitle": "Game of Thrones",
            "author": "GRRM",
            "isbn13": "8888",
            "genre": "fantasy",
            "condition": "new",
            "bookCover": "book_image5.jpeg",
            "status": 0
          }
        ]
      }
    ]
  }
}
```

## Local Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
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
