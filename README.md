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
  - [Create a UserBook relationship](#create-a-userbook-relationship)
  - [Delete a UserBook relationship](#delete-a-userbook-relationship)
3. [Local Setup](#local-setup)
4. [Versions](#versions)
5. [Contributors](#contributors)


## Architecture and Design

<p align="center">
  <img src="https://github.com/The-Readers-Collective/.github/blob/main/profile/assets/DB_schema_2.png?raw=true" />
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
              "status": 0,
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
                  "condition": "Excellent",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
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
                  "pgCount": 638,
                  "description": "Begin your journey into Middle-earth... The inspiration for the upcoming original series on Prime Video, The Lord of the Rings: The Rings of Power. The Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them. Sauron, the Dark Lord, has gathered to him all the Rings of Power—the means by which he intends to rule Middle-earth. All he lacks in his plans for dominion is the One Ring—the ring that rules them all—which has fallen into the hands of the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.",
                  "category": "Adventure",
                  "condition": "Good",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
              }
          },
          {
              "id": "3",
              "userId": "1",
              "bookId": "3",
              "status": 0,
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
                  "condition": "Good",
                  "available": true,
                  "updatedAt": "2022-12-09T01:53:31Z"
              }
          },
          {
              "id": "4",
              "userId": "1",
              "bookId": "4",
              "status": 0,
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
                  "condition": "Poor",
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
          "status": 0,
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
                "condition": "Good",
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
          "condition": "Excellent",
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
          "condition": "Good",
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
          "condition": "Good",
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
          "condition": "Poor",
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
            "condition": "Excellent",
            "available": true,
            "updatedAt": "2022-12-09T01:53:31Z"
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
      pgCount: 356
      description: "Placeholding description"
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
    googleBookId: "aWZzLPhY4o0C", bookTitle: "The Fellowship Of The Ring", author: "J.R.R. Tolkien", pgCount: 200, description: "placeholder description", isbn13: "9780547952017", condition: "Good", category: "Adventure", bookCover: "http://books.google.com/books/content?id=aWZzLPhY4o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", available: false
  }}) {
    book {
      id
      googleBookId
      isbn13
      author
      pgCount
      description
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
        "pgCount": 200, 
        "description": "placeholder description"
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
### Create a UserBook relationship
Lets you create a relationship between a user and a book. (status: 0 (owned), status: 1 (bookmarked))

<b>Example Query:</b>
```json
mutation{
  createUserBook(input:{
    userId: 5,
    bookId: 1,
    status: 1
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
                "status": 1
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
