class ExchangeRate < ApplicationRecord

  # ----- DB Methods ----- #

  def self.getExchangeRates(base, target, date)
    ExchangeRate.where(base_symbol: base, target_symbol: target, date: date)
  end

  def self.createExchangeRates(timestamp, date, historical, base, target, rate)
    ExchangeRate.create(timestamp: timestamp, date: date,  historical: historical, base_symbol: base, target_symbol: target, rate: rate) 
  end

  def self.importedAlready(date)
    date == ExchangeRate.maximum(:date)
  end

end
