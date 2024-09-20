# README

This is the currency tracker app answering to an technical interview demonstration.

By Jonathan Stang

### Ruby version
  - `Ruby 3.1.6p260`

### Rail verison
  - `Rails 7.2.1`

### Database creation

Local run requires a `localhost:5432` Postgresql database with 
  - **username:** `postgres`
  - **password:** `postgres`

* Database initialization

### Configuration
  - For local setup, run the following in terminal
  
```console
bundle install
rails db:create
rails db:migrate
```

### Run

```console
rails s
```

### Deployment

  - Deployed to heroku
