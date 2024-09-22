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

### FixerIO API KEY
- Required!
- Must give a valid FixerIO Api key to the WebApi methods.
- You can get your key for free on [Fixer Website](https://fixer.io/)

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

```ruby
# > rails console example
> RatesCalculator.convert(100, "USD", "NOK", Date.new(2024,9,15))

RESULTS FOR 2024-09-15
    100 United States Dollar
    = 1062.17 Norwegian Krone

    1 USD = 11.78 NOK
    1 NOK = 0.9 USD
```

### Task 3 - daily exchange rate DB storage
See: 
- `config/schedule.rb`

Used the wheneverize gem
```ruby
every 1.day, at: "4:30 am" do
  runner "WebApi.dailyImportFromFixerIO"
end
```

### Task 4 - Web Interface

Partial completion - Currency Conversion form now takes input and calculates, but results are only printed to the terminal.

