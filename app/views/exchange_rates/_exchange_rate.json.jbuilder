json.extract! exchange_rate, :id, :timestamp, :date, :base_symbol, :target_symbol, :rate, :created_at, :updated_at
json.url exchange_rate_url(exchange_rate, format: :json)
