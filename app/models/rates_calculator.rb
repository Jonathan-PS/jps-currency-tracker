class RatesCalculator
  require "date"

  # rails console examples:
  # > RatesCalculator.convert(100, "USD", "NOK", Date.today)
  # > RatesCalculator.convert(100, "USD", "NOK", Date.new(2024,9,15))

  def self.convert(amount, base, target, date)
    # do checks before conversion
    if (amount.class == Integer || amount.class == Float) && date.class == Date  && Currency.bothValid(base, target)
      convertCurrencies(amount, base, target, date)
    else 
      puts "Wrong input arguments!"
    end
  end

  # private # TODO: Problem making all these methods private

  def self.convertCurrencies(amount, base, target, date)
    puts "Date:      #{date}"
    puts "Converting: #{amount} #{base} to #{target}."
    
    bRate = fetchRate("EUR", base, date)
    tRate = fetchRate("EUR", target, date)

    converted = (amount * tRate / bRate).round(2)
    prettyPrint(amount, base, bRate, converted, target, tRate)
    return converted
  end

  def self.fetchRate(base, target, date)
    convRate = ExchangeRate.getExchangeRates("EUR", target, date)

    if convRate.length > 0 # superior check to .exists? or .blank?, since no db query is made.
      puts "Retrieving existing rate from db."
      convRate.last.rate
    else
      puts "We do not have exchange rates for given date. Must import."
      WebApi.importFromFixer(date)

      ExchangeRate.getExchangeRates("EUR", target, date).last.rate
    end
  end

  def self.prettyPrint(amount, base, bRate, converted, target, tRate)
    puts "RESULTS
    #{amount} #{Currency.getName(base)}
    = #{converted} #{Currency.getName(target)}

    1 #{base} = #{(tRate).round(2)} #{target}
    1 #{target} = #{(1.0/bRate).round(2)} #{base}"
  end
end