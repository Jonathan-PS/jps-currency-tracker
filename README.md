# README

This is the currency tracker app answering a technical interview demonstration.

By Jonathan Stang

### Ruby version
  - `Ruby 3.1.6p260`

### Rail verison
  - `Rails 7.2.1`

### Database creation

Local run requires a `localhost:5432` Postgresql database with 
  - **username:** `postgres`
  - **password:** `postgres`

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

  - (planned) deployment to heroku

## Tasks

### Task 1 & Task 2 - Currency conversion
See:
- `lib/web_api.rb`
- `lib/rates_calculator.rb`
- `db/schema.rb`

Given EUR-BASE and EUR-TARGET, the currency conversion is basically:

```ruby
# lib/rates_calculator.rb
...
    converted = (amount * tRate / bRate).round(2)
...
```


### Task 3 - daily exchange rate DB storage
See: 
- `config/schedule.rb``

Used the wheneverize gem
```ruby
every 1.day, at: "4:30 am" do
  runner "WebApi.dailyImportFromFixerIO"
end
```

### Task 4 - Web Interface
TODO

