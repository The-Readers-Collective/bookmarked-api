# Back End Repository for Bookmarked

[Return to Main Page](https://github.com/The-Readers-Collective)

## Table of Contents

1. [Architecture and Design](#architecture-and-design)
2. [Available API End Points](#all-available-api-end-points)
  - [Create User](#create-user)
  - [All Users](#all-users)
  - [One User](#one-user)
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
### Delete a User
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
