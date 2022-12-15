# Back End Repository for Bookmarked

[Deployed BE Site](https://bookmarked-api.herokuapp.com/graphql)

[Return to Main Page](https://github.com/The-Readers-Collective)

## Table of Contents

1. [Architecture and Design](#architecture-and-design)
2. [Available API Query Points](#all-available-api-query-points)
	- Queries
		- Users
		  - [View All Users](#view-all-users)
		  - [View One User](#view-one-user)
		  - [View "Books Owned" by User](#view-books-owned-by-user)
		  - [View "Books Bookmarked" by User](#view-books-bookmarked-by-user)
		  - [View "Followings" by User](#view-followings-by-user)
		  - [View All Users, their UserBooks, and their Books](#view-all-users-and-all-books)
		  - [View a single User, their UserBooks, and their Books](#view-a-single-user-and-their-books)
		- Books
		  - [View All Books](#view-all-books)
		  - [View One Book](#view-a-single-book)
		  - [View Books by GoogleBookId](#view-books-by-googlebookid)
		- Google Book API Queries
		  - [Search for all books by Title](#search-for-all-books-by-title)
		  - [Search for book by GoogleBookId](#search-for-google-book-by-googlebookid)

	- Mutations
		- Users
		  - [Create User](#create-user)
		  - [Delete User](#delete-user)
		  - [Update User](#update-user)
		- Books
			- [Create Book](#create-a-book)
			- [Delete Book](#delete-a-book)
			- [Update Book](#update-a-book)
		- UserBooks
			- [Create a UserBook relationship](#create-a-userbook-relationship)
			- [Delete a UserBook relationship](#delete-a-userbook-relationship)
		- Followings
			- [Create a Following](#create-a-following)
			- [Delete a Following](#delete-a-following)
3. [Local Setup](#local-setup)
4. [Versions](#versions)
5. [Contributors](#contributors)


## Architecture and Design

<p align="center">
  <img src="https://github.com/The-Readers-Collective/.github/blob/main/profile/assets/Bookmarked_Schema_3.png?raw=true" />
</p>

## All Available API Query Points:

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
Lets you update attributes of a single User. Send in whatever attribute(s) you want to update.
* Availble User mutation fields: `name`, `zipcode`, `email`, `updatedAt`

<b>Example Query:</b>
```json
mutation{
  updateUser(input:{id: "2", attributes:{
    name: "Bob Joe"
  }}) {
    user {
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
                "name": "Bob Joe"
            }
        }
    }
}
```

### View All Users and All Books
Lets you view all users, their UserBooks relationship, and all their books

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
        pgCount
        description
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
              "status": "OWNED",
              "book": {
                  "id": "1",
                  "googleBookId": "tXGRBgwxAHIC",
                  "isbn13": "9780316202275",
                  "author": "James S. A. Corey",
                  "bookTitle": "Caliban's War",
                  "bookCover": "http://books.google.com/books/content?id=tXGRBgwxAHIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                  "pgCount": 624,
                  "description": "The second book in the NYT bestselling Expanse series, Caliban's War shows a solar system on the brink of war, and the only hope of peace rests on James Holden and the crew of the Rocinante's shoulders. Now a Prime Original series. We are not alone. On Ganymede, breadbasket of the outer planets, a Martian marine watches as her platoon is slaughtered by a monstrous supersoldier. On Earth, a high-level politician struggles to prevent interplanetary war from reigniting. And on Venus, an alien protomolecule has overrun the planet, wreaking massive, mysterious changes and threatening to spread out into the solar system. In the vast wilderness of space, James Holden and the crew of the Rocinante have been keeping the peace for the Outer Planets Alliance. When they agree to help a scientist search war-torn Ganymede for a missing child, the future of humanity rests on whether a single ship can prevent an alien invasion that may have already begun . . .",
                  "category": "Sci-Fi",
                  "condition": "EXCELLENT",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
              }
          },
          {
              "id": "2",
              "userId": "1",
              "bookId": "2",
              "status": "OWNED",
              "book": {
                  "id": "2",
                  "googleBookId": "aWZzLPhY4o0C",
                  "isbn13": "9780547952017",
                  "author": "J.R.R. Tolkien",
                  "bookTitle": "The Fellowship Of The Ring",
                  "bookCover": "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                  "pgCount": 638,
                  "description": "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.",
                  "category": "Adventure",
                  "condition": "GOOD",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
              }
          },
          {
              "id": "3",
              "userId": "1",
              "bookId": "3",
              "status": "OWNED",
              "book": {
                  "id": "3",
                  "googleBookId": "hffZtgAACAAJ",
                  "isbn13": "9780007428540",
                  "author": "George R. R. Martin",
                  "bookTitle": "A Game of Thrones",
                  "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                  "pgCount": 864,
                  "description": "A NEW ORIGINAL SERIES, NOW ON HBO. Here is the first volume in George R. R. Martin's magnificent cycle of novels that includes \"A Clash of Kings\" and \"A Storm of Swords.\" As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin's stunning series is destined to stand as one of the great achievements of imaginative fiction. A GAME OF THRONES Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom's protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones. \"From the Paperback edition.\"",
                  "category": "Fantasy",
                  "condition": "GOOD",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
              }
          },
          {
              "id": "4",
              "userId": "1",
              "bookId": "4",
              "status": "OWNED",
              "book": {
                  "id": "4",
                  "googleBookId": "1q_xAwAAQBAJ",
                  "isbn13": "9780385371988",
                  "author": "Dr. Seuss",
                  "bookTitle": "Oh, the Places You'll Go!",
                  "bookCover": "http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                  "pgCount": 56,
                  "description": "A perennial favorite, Dr. Seuss’s wonderfully wise graduation speech is the perfect send-off for children starting out in the world, be they nursery school, high school, or college grads! From soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life’s ups and downs with his trademark humorous verse and illustrations, while encouraging readers to find the success that lies within. In a starred review, Booklist notes: “Seuss’s message is simple but never sappy: life may be a ‘Great Balancing Act,’ but through it all ‘There’s fun to be done.’” This Read & Listen edition contains audio narration.",
                  "category": "Childrens Book",
                  "condition": "POOR",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
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
        pgCount
        description
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
          "status": "OWNED",
          "book": {
                "id": "3",
                "isbn13": "9780007428540",
                "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                "bookTitle": "A Game of Thrones",
                "pgCount": 864,
                "description": "A NEW ORIGINAL SERIES, NOW ON HBO. Here is the first volume in George R. R. Martin's magnificent cycle of novels that includes \"A Clash of Kings\" and \"A Storm of Swords.\" As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin's stunning series is destined to stand as one of the great achievements of imaginative fiction. A GAME OF THRONES Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom's protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones. \"From the Paperback edition.\"",
                "author": "George R. R. Martin",
                "googleBookId": "hffZtgAACAAJ",
                "category": "Fantasy",
                "condition": "GOOD",
                "available": true,
                "updatedAt": "2022-12-09T01:53:31Z"
            }
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
    pgCount
    description
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
          "pgCount": 624,
          "description": "The second book in the NYT bestselling Expanse series, Caliban's War shows a solar system on the brink of war, and the only hope of peace rests on James Holden and the crew of the Rocinante's shoulders. Now a Prime Original series. We are not alone. On Ganymede, breadbasket of the outer planets, a Martian marine watches as her platoon is slaughtered by a monstrous supersoldier. On Earth, a high-level politician struggles to prevent interplanetary war from reigniting. And on Venus, an alien protomolecule has overrun the planet, wreaking massive, mysterious changes and threatening to spread out into the solar system. In the vast wilderness of space, James Holden and the crew of the Rocinante have been keeping the peace for the Outer Planets Alliance. When they agree to help a scientist search war-torn Ganymede for a missing child, the future of humanity rests on whether a single ship can prevent an alien invasion that may have already begun . . .",
          "category": "Sci-Fi",
          "condition": "EXCELLENT",
          "available": true,
          "updatedAt": "2022-12-09T01:53:31Z"
      },
      {
          "id": "2",
          "googleBookId": "aWZzLPhY4o0C",
          "isbn13": "9780547952017",
          "author": "J.R.R. Tolkien",
          "bookTitle": "The Fellowship Of The Ring",
          "bookCover": "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
          "pgCount": 638,
          "description": "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.",
          "category": "Adventure",
          "condition": "GOOD",
          "available": true,
          "updatedAt": "2022-12-09T01:53:31Z"
      },
      {
          "id": "3",
          "googleBookId": "hffZtgAACAAJ",
          "isbn13": "9780007428540",
          "author": "George R. R. Martin",
          "bookTitle": "A Game of Thrones",
          "bookCover": "http://books.google.com/books/content?id=hffZtgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
          "pgCount": 864,
          "description": "A NEW ORIGINAL SERIES, NOW ON HBO. Here is the first volume in George R. R. Martin's magnificent cycle of novels that includes \"A Clash of Kings\" and \"A Storm of Swords.\" As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin's stunning series is destined to stand as one of the great achievements of imaginative fiction. A GAME OF THRONES Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom's protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones. \"From the Paperback edition.\"",
          "category": "Fantasy",
          "condition": "GOOD",
          "available": true,
          "updatedAt": "2022-12-09T01:53:31Z"
      },
      {
          "id": "4",
          "googleBookId": "1q_xAwAAQBAJ",
          "isbn13": "9780385371988",
          "author": "Dr. Seuss",
          "bookTitle": "Oh, the Places You'll Go!",
          "bookCover": "http://books.google.com/books/content?id=1q_xAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
          "pgCount": 56,
          "description": "A perennial favorite, Dr. Seuss’s wonderfully wise graduation speech is the perfect send-off for children starting out in the world, be they nursery school, high school, or college grads! From soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life’s ups and downs with his trademark humorous verse and illustrations, while encouraging readers to find the success that lies within. In a starred review, Booklist notes: “Seuss’s message is simple but never sappy: life may be a ‘Great Balancing Act,’ but through it all ‘There’s fun to be done.’” This Read & Listen edition contains audio narration.",
          "category": "Childrens Book",
          "condition": "POOR",
          "available": true,
          "updatedAt": "2022-12-09T01:53:31Z"
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
    pgCount
    description
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
            "pgCount": 624,
            "description": "The second book in the NYT bestselling Expanse series, Caliban's War shows a solar system on the brink of war, and the only hope of peace rests on James Holden and the crew of the Rocinante's shoulders. Now a Prime Original series. We are not alone. On Ganymede, breadbasket of the outer planets, a Martian marine watches as her platoon is slaughtered by a monstrous supersoldier. On Earth, a high-level politician struggles to prevent interplanetary war from reigniting. And on Venus, an alien protomolecule has overrun the planet, wreaking massive, mysterious changes and threatening to spread out into the solar system. In the vast wilderness of space, James Holden and the crew of the Rocinante have been keeping the peace for the Outer Planets Alliance. When they agree to help a scientist search war-torn Ganymede for a missing child, the future of humanity rests on whether a single ship can prevent an alien invasion that may have already begun . . .",
            "category": "Sci-Fi",
            "condition": "EXCELLENT",
            "available": true,
            "updatedAt": "2022-12-09T01:53:31Z"
        }
    }
}
```

### Create a Book
Lets you create a Book and by passing in the userId it will also automatically create the UserBook relationship of `OWNED`

<b>Example Query:</b>
```json
mutation{
  createBook(input:{
      googleBookId: "E-kdBQAAQBAJ"
      isbn13: "9781619634459"
      author: "Sarah J. Maas"
      bookTitle: "A Court of Thorns and Roses"
      bookCover: "http://books.google.com/books/content?id=E-kdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
      pgCount: 356
      description: "Placeholding description"
      category: "Fiction"
      condition: "EXCELLENT"
      available: true
      userId: 1
    }){
    book {
      id,
      googleBookId,
      isbn13,
      author,
      bookTitle,
      bookCover,
      pgCount,
      description,
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
        "pgCount": 356
        "description": "Placeholding description"
        "category": "Fiction",
        "condition": "EXCELLENT",
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
* Availble Book mutation fields: `available`, `googleBookId`, `bookTitle`, `author`, `pgCount`, `description`, `isbn13`, `condition`, `bookCover`


<b>Example Query:</b>
```json
mutation{
  updateBook(input:{id: "2", attributes:{
    available: false
  }}) {
    book {
      id
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
                "available": false,
                "updatedAt": "2022-12-11T20:32:25Z"
            }
        }
    }
}
```
### Create a UserBook relationship
Lets you create a relationship between a user and a book. (status: 0 (owned), status: 1 (bookmarked))

<b>Example Query:</b>
```json
mutation{
  createUserBook(input:{
    userId: 5,
    bookId: 1,
    status: "BOOKMARKED"
  }){
    userBook {
      id,
      userId,
      bookId,
      status
    }
    errors
  }
}
```

<b>Example Output:</b>

```json
{
    "data": {
        "createUserBook": {
            "userBook": {
                "id": "79",
                "userId": "5",
                "bookId": "1",
                "status": "BOOKMARKED"
            },
            "errors": []
        }
    }
}
```
### Delete a UserBook Relationship
Lets you delete the relationship between a user and their book

<b>Example Query:</b>
```json
mutation{
    destroyUserBook(input:{id: "79"}){
        id
    }
}
```

<b>Example Output:</b>

```json
{
    "data": {
        "destroyUserBook": {
            "id": "79"
        }
    }
}
```

### Create a Following
Lets you create a following between a follower user and the followed user.

<b>Example Query:</b>
```json
mutation {
    createFollowing(input:{followerId: "1", followedId: "2"}) {
		following {
        	id
        	followedId
        	followerId
      	}
 	 }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "createFollowing": {
      "following": {
        "id": "6",
        "followedId": "2",
        "followerId": "1"
      }
    }
  }
}
```

### Delete a Following
Lets you destroy a following with a given following id

<b>Example Query:</b>
```json
mutation {
    destroyFollowing(input:{id: "6"}) {
			id
 	 } 
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "destroyFollowing": {
       "id": "6"
    }
  }
}
```

### View Books Owned by User
Lets you view all books owned by user
* Availble User query fields: `name`, `zipcode`, `email`

* Availble Book query fields: `available`, `googleBookId`, `bookTitle`, `author`, `pgCount`, `description`, `isbn13`, `condition`, `bookCover`

<b>Example Query:</b>
```json
query {
  user(id: 1) {
    allOwnedBooks {
      id
      bookTitle
      googleBookId
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "user": {
      "allOwnedBooks": [
        {
          "id": "1",
          "bookTitle": "Caliban's War",
          "googleBookId": "tXGRBgwxAHIC"
        },
        {
          "id": "2",
          "bookTitle": "The Fellowship Of The Ring",
          "googleBookId": "aWZzLPhY4o0C"
        },
        {
          "id": "3",
          "bookTitle": "A Game of Thrones",
          "googleBookId": "hffZtgAACAAJ"
        }
      ]
    }
  }
}
```

### View Books Bookmarked by User
Lets you view all books bookmarked by user
* Availble User query fields: `name`, `zipcode`, `email`

* Availble Book query fields: `available`, `googleBookId`, `bookTitle`, `author`, `pgCount`, `description`, `isbn13`, `condition`, `bookCover`

<b>Example Query:</b>
```json
query {
  user(id: 1) {
    allBookmarkedBooks {
      id
      bookTitle
      googleBookId
    }
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "user": {
      "allBookmarkedBooks": [
        {
          "id": "11",
          "bookTitle": "Twilight",
          "googleBookId": "ZfjzX7M8zt0C"
        },
        {
          "id": "21",
          "bookTitle": "Warriors: Cats of the Clans",
          "googleBookId": "i5PTBqxDO4cC"
        },
        {
          "id": "31",
          "bookTitle": "Babel",
          "googleBookId": "ZWRQEAAAQBAJ"
        },
        {
          "id": "41",
          "bookTitle": "The Way of Kings",
          "googleBookId": "QVn-CgAAQBAJ"
        },
        {
          "id": "44",
          "bookTitle": "The Dragonbone Chair",
          "googleBookId": "BSuJEAAAQBAJ"
        }
      ]
    }
  }
}
```

### View Followings by User
Lets you view all Users the given user is following

<b>Example Query:</b>
```json
query {
    user(id: "1") {
			allFollowings {
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
    "user": {
      "allFollowings": [
        {
          "id": "3",
          "name": "Paul B"
        },
        {
          "id": "2",
          "name": "Joe B"
        },
        {
          "id": "4",
          "name": "Jane D"
        }
      ]
    }
  }
}
```

### View Books by GoogleBookId
Lets you view all books by GoogleBookID. Also more book attributes are accessible ie bookCover

<b>Example Query:</b>
```json
query {
    booksByGoogleBookId(googleBookId: "aWZzLPhY4o0C") {
      id
      bookTitle
      isbn13
      author
   } 
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "booksByGoogleBookId": [
      {
        "id": "2",
        "bookTitle": "The Fellowship Of The Ring",
        "isbn13": "9780547952017",
        "author": "J.R.R. Tolkien"
      },
      {
        "id": "6",
        "bookTitle": "The Fellowship Of The Ring",
        "isbn13": "9780547952017",
        "author": "J.R.R. Tolkien"
      },
      {
        "id": "16",
        "bookTitle": "The Fellowship Of The Ring",
        "isbn13": "9780547952017",
        "author": "J.R.R. Tolkien"
      }
    ]
  }
}
```

### Google Book API Queries
Current Google Book API queries:

#### Search for all books by Title
Lets you ping Google API search by Book Title

<b>Example Query:</b>
```json
query {
	googleBooks(title:"Lord of the rings") {
    bookTitle
    bookCover
    author
    category
    description
    googleBookId
    isbn13
    pgCount
  }
}
```

<b>Example Output:</b>

```json
{
  "data": {
    "googleBooks": [
      {
        "bookTitle": "The Lord Of The Rings",
        "bookCover": "http://books.google.com/books/content?id=yl4dILkcqm4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "author": "J.R.R. Tolkien",
        "category": "Fiction",
        "description": "Immerse yourself in Middle-earth with J.R.R. Tolkien’s classic masterpieces behind the films... This special 50th anniversary edition includes three volumes of The Lord of the Rings (The Fellowship of the Ring, The Two Towers, and The Return of the King), along with an extensive new index—a must-own tome for old and new Tolkien readers alike. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins. From Sauron's fastness in the Dark Tower of Mordor, his power spread far and wide. Sauron gathered all the Great Rings to him, but always he searched for the One Ring that would complete his dominion. When Bilbo reached his eleventy-first birthday he disappeared, bequeathing to his young cousin Frodo the Ruling Ring and a perilous quest: to journey across Middle-earth, deep into the shadow of the Dark Lord, and destroy the Ring by casting it into the Cracks of Doom. The Lord of the Rings tells of the great quest undertaken by Frodo and the Fellowship of the Ring: Gandalf the Wizard; the hobbits Merry, Pippin, and Sam; Gimli the Dwarf; Legolas the Elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. J.R.R. Tolkien (1892-1973), beloved throughout the world as the creator of The Hobbit, The Lord of the Rings, and The Silmarillion, was a professor of Anglo-Saxon at Oxford, a fellow of Pembroke College, and a fellow of Merton College until his retirement in 1959. His chief interest was the linguistic aspects of the early English written tradition, but while he studied classic works of the past, he was creating a set of his own.",
        "googleBookId": "yl4dILkcqm4C",
        "isbn13": "9780547951942",
        "pgCount": 1216
      },
      {
        "bookTitle": "The Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=GuLZAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "John Ronald Reuel Tolkien",
        "category": "Fiction",
        "description": "An epic depicting the Great War of the Ring, a struggle between good and evil in Middle-Earth, in which the tiny Hobbits play a key role.",
        "googleBookId": "GuLZAAAAMAAJ",
        "isbn13": "PSU:000062491532",
        "pgCount": 1157
      },
      {
        "bookTitle": "Understanding the Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=GEWXQbASXZUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        "author": "Rose A. Zimbardo, Neil D. Isaacs",
        "category": "Literary Criticism",
        "description": "Selected essays on Tolkien's trilogy include W. H. Auden's essay on the hero's quest, C. S. Lewis's piece on the value of myth, Marion Zimmer Bradley's article on hero worship, Tim Shippey's piece on the film trilogy, and much more. Original.",
        "googleBookId": "GEWXQbASXZUC",
        "isbn13": "0618422536",
        "pgCount": 308
      },
      {
        "bookTitle": "The Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=636fngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "J. R. R. Tolkien, Alan Lee",
        "category": "Fantasy fiction",
        "description": "A sumptuous new one-volume edition of Tolkien's classic masterpiece that is fully illustrated in watercolour throughout by the acclaimed and award-winning artist, Alan Lee. Since it was first published in 1954, The Lord of the Rings has been a book people have treasured. Steeped in unrivalled magic and otherworldliness, its sweeping fantasy has touched the hearts of young and old alike. Well over 100 million copies of its many editions have been sold around the world, and occasional collectors' editions become prized and valuable items of publishing. With the epic trilogy now an acclaimed, award-winning and billion-dollar success, images of the characters and landscapes have become iconic to a whole new generation of readers. Much of the look of these movies is based on Alan Lee's paintings, giving this sumptuous new edition of Tolkien's great work new relevance for the ever-growing number of fans.",
        "googleBookId": "636fngEACAAJ",
        "isbn13": "0007525540",
        "pgCount": 1200
      },
      {
        "bookTitle": "The Lord of the Rings Boxed Set",
        "bookCover": "http://books.google.com/books/content?id=v0XdnQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "J R R Tolkien, Wayne G Hammond",
        "category": "Fantasy fiction, English",
        "description": "Four-volume boxed-set edition of The Lord of the Rings in hardback, featuring Tolkien's original unused dust-jacket designs, together with fourth hardback volume, The Lord of the Rings: A Reader's Companion. Includes special features and the definitive edition of the text. Since it was first published in 1954, The Lord of the Rings has been a book people have treasured. Steeped in unrivalled magic and otherworldliness, its sweeping fantasy has touched the hearts of young and old alike, with one hundred and fifty million copies of its many editions sold around the world. In 2005 Tolkien's text was fully restored - with the full co-operation of Christopher Tolkien -- with almost 400 corrections, the original red and black maps as fold-out sheets, a fully revised and enlarged index, and for the first time a special plate section containing the pages from the Book of Mazarbul, making this set as close as possible to the version that J.R.R. Tolkien intended. This Diamond Anniversary reissue of the prized boxed set marks 60 years since the first publication of The Fellowship of the Ring. These hardback editions feature Tolkien's original unused dust-jacket designs from the 1950s, reworked for this edition, and some additional text corrections. The four-volume boxed set includes The Lord of the Rings: A Reader's Companion, a unique annotated guide to the text, fully updated since its first publication in 2005, and is a book which will enhance the reader's enjoyment and understanding of one of the most influential books of the 20th century.",
        "googleBookId": "v0XdnQEACAAJ",
        "isbn13": "0007581149",
        "pgCount": 1472
      },
      {
        "bookTitle": "The Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=esTyzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "J. R. R. TOLKIEN",
        "category": null,
        "description": "J.R.R. Tolkien's grand masterwork illustrated with the art created by Tolkien himself as he envisioned Middle-earth A PBS Great American Read Top 100 Pick One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins. From Sauron's fastness in the Dark Tower of Mordor, his power spread far and wide. Sauron gathered all the Great Rings to him, but always he searched for the One Ring that would complete his dominion. When Bilbo reached his eleventy-first birthday he disappeared, bequeathing to his young cousin Frodo the Ruling Ring and a perilous quest: to journey across Middle-earth, deep into the shadow of the Dark Lord, and destroy the Ring by casting it into the Cracks of Doom. The Lord of the Rings tells of the great quest undertaken by Frodo and the Fellowship of the Ring: Gandalf the Wizard; the hobbits Merry, Pippin, and Sam; Gimli the Dwarf; Legolas the Elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. This new edition is illustrated with J.R.R. Tolkien's own artwork, created as he wrote the original text.",
        "googleBookId": "esTyzgEACAAJ",
        "isbn13": "0063274736",
        "pgCount": 1248
      },
      {
        "bookTitle": "The Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=7bT5gO7CrVMC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "Brian Sibley",
        "category": "Performing Arts",
        "description": "Discusses the making of the movie trilogy based on J.R.R. Tolkien's \"The Lord of the Rings,\" covering topics including filming locations, special effects, costumes, battle scenes, characters, and music.",
        "googleBookId": "7bT5gO7CrVMC",
        "isbn13": "0618260226",
        "pgCount": 190
      },
      {
        "bookTitle": "The Hobbit and the Lord of the Rings Boxed Set",
        "bookCover": "http://books.google.com/books/content?id=INVTzQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "J.r.r. Tolkien",
        "category": null,
        "description": "Immerse yourself in Middle-earth with Tolkien's classic masterpiece, telling the complete story of Bilbo Baggins and the Hobbits' epic encounters with Gandalf, Gollum, dragons and monsters, in the quest to destroy the One Ring. When they were first published, The Hobbit and The Lord of the Rings became instant classics. Treasured by readers young and old, these works of sweeping fantasy, steeped in unrivalled magic and otherworldliness have sold more than 150 million copies around the world. This new boxed set offers readers a new opportunity to discover Tolkien's remarkable world of Middle-earth and to follow the complete story of Bilbo Baggins and the Hobbits' part in the epic quest for the Ring - beginning with Bilbo's fateful visit from Gandalf and culminating in the dramatic climax between Frodo and Gollum atop Mount Doom and Bilbo's departure to the Grey Havens.",
        "googleBookId": "INVTzQEACAAJ",
        "isbn13": "0008387753",
        "pgCount": 1600
      },
      {
        "bookTitle": "The Lord of the Rings",
        "bookCover": "http://books.google.com/books/content?id=nh0eAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "Wayne G. Hammond, Christina Scull",
        "category": "Fiction",
        "description": "A companion reference to the film trilogy and the book presents changes made to the original novel, references to various illustrations and maps, explanations of unique words, and a primer on Tolkien's invented languages.",
        "googleBookId": "nh0eAQAAIAAJ",
        "isbn13": "STANFORD:36105114581718",
        "pgCount": 988
      },
      {
        "bookTitle": "The Middle-Earth Treasury",
        "bookCover": "http://books.google.com/books/content?id=XuO0tAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        "author": "J. R. R. Tolkien",
        "category": "Fantasy fiction, English",
        "description": "Deluxe boxed gift set of pocket edition hardbacks featuring J.R.R. Tolkien's most popular works, which together tell the tale of Bilbo and Frodo Baggins and of the War of the Ring. When they were first published, The Hobbit and The Lord of the Rings became instant classics. Treasured by readers young and old, these works of sweeping fantasy, steeped in unrivalled magic and otherworldliness have sold more than 150 million copies around the world. This new boxed set, published to mark the 80th anniversary of the publication of The Hobbit, offers readers a new opportunity to discover Tolkien's remarkable world of Middle-earth and to follow the complete story of Bilbo Baggins and the Hobbits' part in the epic quest for the Ring - beginning with Bilbo's fateful visit from Gandalf and culminating in the dramatic climax between Frodo and Gollum atop Mount Doom and Bilbo's departure to the Grey Havens.",
        "googleBookId": "XuO0tAEACAAJ",
        "isbn13": "0008260184",
        "pgCount": 912
      }
    ]
  }
}
```
#### Search for Google Book by GoogleBookId
Lets you search Google Book API via the GoogleBookId

<b>Example Query:</b>
```json
query{
  googleBook(googleBookID: "QCPBDwAAQBAJ") {
    googleBookId
    bookTitle
    bookCover
    author
    isbn13
	pgCount
    description
    category
  }
}
```

<b>Example Output:</b>

```json
{
    "data": {
        "googleBook": [
            {
                "googleBookId": "QCPBDwAAQBAJ",
                "bookTitle": "Rhythm of War",
                "bookCover": "http://books.google.com/books/content?id=QCPBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                "author": "Brandon Sanderson",
                "isbn13": "9781429952040",
                "pgCount": 1374,
                "description": "An instant #1 New York Times Bestseller and a USA Today and Indie Bestseller! The Stormlight Archive saga continues in Rhythm of War, the eagerly awaited sequel to Brandon Sanderson's #1 New York Times bestselling Oathbringer, from an epic fantasy writer at the top of his game. After forming a coalition of human resistance against the enemy invasion, Dalinar Kholin and his Knights Radiant have spent a year fighting a protracted, brutal war. Neither side has gained an advantage, and the threat of a betrayal by Dalinar’s crafty ally Taravangian looms over every strategic move. Now, as new technological discoveries by Navani Kholin’s scholars begin to change the face of the war, the enemy prepares a bold and dangerous operation. The arms race that follows will challenge the very core of the Radiant ideals, and potentially reveal the secrets of the ancient tower that was once the heart of their strength. At the same time that Kaladin Stormblessed must come to grips with his changing role within the Knights Radiant, his Windrunners face their own problem: As more and more deadly enemy Fused awaken to wage war, no more honorspren are willing to bond with humans to increase the number of Radiants. Adolin and Shallan must lead the coalition’s envoy to the honorspren stronghold of Lasting Integrity and either convince the spren to join the cause against the evil god Odium, or personally face the storm of failure. Other Tor books by Brandon Sanderson The Cosmere The Stormlight Archive The Way of Kings Words of Radiance Edgedancer (Novella) Oathbringer Rhythm of War The Mistborn trilogy Mistborn: The Final Empire The Well of Ascension The Hero of Ages Mistborn: The Wax and Wayne series Alloy of Law Shadows of Self Bands of Mourning Collection Arcanum Unbounded Other Cosmere novels Elantris Warbreaker The Alcatraz vs. the Evil Librarians series Alcatraz vs. the Evil Librarians The Scrivener's Bones The Knights of Crystallia The Shattered Lens The Dark Talent The Rithmatist series The Rithmatist Other books by Brandon Sanderson The Reckoners Steelheart Firefight Calamity At the Publisher's request, this title is being sold without Digital Rights Management Software (DRM) applied.",
                "category": "Fiction"
            },
            {
                "googleBookId": "QcpBDwAAQBAJ",
                "bookTitle": "Біле Ікло (з ілюстраціями)",
                "bookCover": "http://books.google.com/books/content?id=QcpBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                "author": "Джек Лондон",
                "isbn13": "9785040938896",
                "pgCount": 241,
                "description": "Безкраї та суворі північні краї накладають відбиток на життя людей і тварин. Їх непереборна сила здатна зламати будь-кого, і тільки наймужніші та найвитриваліші здатні цю силу здолати. Саме таким і був головний герой повісті Джека Лондона – ні, не людина, а вовк на ймення Біле Ікло, що відмінно засвоїв науку виживати в будь-яких несприятливих умовах.Письменник в деталях описує психологію, мотиви поведінки і вчинки Білого Ікла, показує, як доброта і ласка по відношенню до живої істоти вчить його платити любов'ю за любов. А для розумного прирученого вовка любов була дорожча за життя.Ілюстрації Валерії Гогіної.",
                "category": "Juvenile Fiction"
            },
            {
                "googleBookId": "qCpBDwAAQBAJ",
                "bookTitle": "Persoonlijkheidsdiagnostiek in de klinische praktijk",
                "bookCover": "http://books.google.com/books/content?id=qCpBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                "author": "W.M. Snellen",
                "isbn13": "9789036819398",
                "pgCount": 319,
                "description": "Dit boek helpt klinische professionals om het uiterste uit hun psychodiagnostische onderzoeksmateriaal te halen. Het leert ze om de resultaten van persoonlijkheidsdiagnostiek optimaal te integreren en te interpreteren. Daarbij geeft het boek antwoord op vragen als: welke betekenis moet je toekennen aan psychische klachten en symptomen? En hoe kun je de resultaten van persoonlijkheidsdiagnostiek in een individuele context plaatsen? Zo krijgt de psychodiagnosticus een helder beeld van de veerkracht én de kwetsbaarheid van de cliënt. In Persoonlijkheidsdiagnostiek in de klinische praktijk wordt persoonlijkheidsonderzoek bij cliënten met psychopathologie voor het eerst behandeld uit het perspectief van de psychodiagnosticus zelf. De theoriegestuurde methodische visie en werkwijze worden in dit nieuwe standaardwerk geïllustreerd met casuïstiek, waarbij er ook aandacht is voor de belangrijkste valkuilen. De beslisbomen en stappenplannen ondersteunen de lezer bij zijn dagelijkse diagnostische werkzaamheden. Het boek is bestemd voor professionals werkzaam in de GGZ, zoals gz-psychologen, psychotherapeuten, klinisch psychologen, psychiaters en zij die daartoe in opleiding zijn. Wim Snellen is expert op het gebied van de persoonlijkheidsdiagnostiek. Hij werkte ruim veertig jaar als klinisch psycholoog in de psychiatrie en heeft uitgebreide ervaring met het geven van cursussen, supervisie en onderwijs in dit vakgebied.",
                "category": "Psychology"
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

