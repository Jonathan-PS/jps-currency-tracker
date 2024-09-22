# DB stuff

### Latest API call
access_key = xxx

http://data.fixer.io/api/latest
    ? access_key = x 

#### Response

{
    "success": true,
    "timestamp": 1519296206,
    "base": "EUR",
    "date": "2024-09-20",
    "rates": {
        "AUD": 1.566015,
        "CAD": 1.560132,
        "CHF": 1.154727,
        "CNY": 7.827874,
        "GBP": 0.882047,
        "JPY": 132.360679,
        "USD": 1.23396,
    [...]
    }
}

### Historical API call

http://data.fixer.io/api/2013-12-24
    ? access_key = x
    & base = GBP
    & symbols = USD,CAD,EUR

#### Response
{
    "success": true,
    "historical": true,
    "date": "2013-12-24",
    "timestamp": 1387929599,
    "base": "GBP",
    "rates": {
        "USD": 1.636492,
        "EUR": 1.196476,
        "CAD": 1.739516
    }
}

### Supported Symbols Endpoint

http://data.fixer.io/api/symbols
    ? access_key = x

{
  "success": true,
  "symbols": {
    "AED": "United Arab Emirates Dirham",
    "AFN": "Afghan Afghani",
    "ALL": "Albanian Lek",
    "AMD": "Armenian Dram",
    [...]
    }
}

## THUS

- The Fixer API comes with a constantly updated endpoint returning all available currencies. To access this list, make a request to the API's symbols endpoint.



### Table Symbols 
- column id: Long auto generated
- column symbol: String
- column name: String
- created_date
- updated_date

```console
rails generate scaffold Currencies name:string acronym:string
```

### Table ExchangeRates
- column id - Long auto generated
- column timestamp - Long number
- column date - Datestamp
- column base_symbol - Long
- colmun target_symbol - Long
- column rate - decimal
- created_date
- updated_date

```console
rails generate scaffold ExchangeRates timestamp:bigint date:date base_symbol:string target_symbol:string rate:decimal
```


response = RestClient.get('http://data.fixer.io/api/latest?access_key = xxx')
exchange_rates = JSON.parse(response.body)


----


## Ruby Code in rails console

```ruby
### get latest data (base=EUR by default)
response = RestClient.get('http://data.fixer.io/api/latest?access_key=xxxx')
erates = JSON.parse(response.body)

## Each create in its own transaction
erates["rates"].each do |key, value| 
  ExchangeRate.create(timestamp: erates["timestamp"], date: erates["date"],  historical: false, base_symbol: erates["base"], target_symbol: key, rate: value) 
end


### get symbols
response2 = RestClient.get('http://data.fixer.io/api/symbols?access_key=xxx')
symbols = JSON.parse(response2.body)

symbols["symbols"].each do |k, v|
  p Currency.create(name: v, acronym: k)
end
```





# Cron Jobs

Wheneverize



<!-- TESTING STUFF OUT 


<%= form_with do |form| %>
  <%= form.number_field :price, :value => 1 %>
  
  <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, selected: 2, prompt: true, id: "base", class: "form-select") %>
  <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, prompt: true, id: "target", class: "form-select") %>
  <%= form.date_field :born_on %> 

  <%= form.submit "Search" %>


<% end %>


<%= form_with model: @exchange_rate do |er| %>
      <%= er.date_field :date %>
      <%= er.number_field :amount %>
      <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, prompt: true, id: "base", class: "form-select") %>
      <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, prompt: true, id: "target", class: "form-select") %>
<% end %>

<%= form_with url: "/search", method: :get do |form| %>
  <%= form.number_field :price, :value => 1 %>
  
  <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, prompt: true, id: "base", class: "form-select") %>
  <%= collection_select(:id, :acronym, Currency.all, :id, :acronym_with_name, prompt: true, id: "target", class: "form-select") %>
  <%= form.date_field :born_on %> 

  <%= form.submit "Search" %>


<% end %>

<div class="container">
  <div class="row row-cols-3">
    <div class="col">
      <label for="amount" class="form-label">Amount</label>
      <input type="amount" class="form-control" id="inputAmount" placeholder="1">
    </div>
    <div class="col">
      <label for="inputBaseCurrency" class="form-label">From</label>
      <select id="inputBaseCurrency" class="form-select">
        <option selected>EUR - Euro</option>
        <option>USD - United States Dollar</option>
        <option>GBP - Great Britain Pound</option>
        <option>NOK - Norwegian Krone</option>
      </select>
    </div>
    <div class="col">
      <label for="inputTargetCurrency" class="form-label">To</label>
      <select id="inputBaseCurrency" class="form-select">
        <option>EUR - Euro</option>
        <option>USD - United States Dollar</option>
        <option>GBP - Great Britain Pound</option>
        <option selected>NOK - Norwegian Krone</option>
      </select>
    </div>
    <div class="col">
      <label for="startDate">Date</label>
      <input id="startDate" class="form-control" type="date" />
    </div>
    <div class="col">
    </div>
    <div class="col">
      <label for="convert" class="form-label"></label>
      <button id="convert" type="button" class="form-control btn btn-dark">Convert</button>
    </div>
  </div>
</div>

-->
