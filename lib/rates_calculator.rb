module RatesCalculator
  include WebApi
  require "date"

  # rails console examples:
  # > RatesCalculator.convert(100, "USD", "NOK", Date.today)
  # > RatesCalculator.convert(100, "USD", "NOK", Date.new(2024,9,15))

  def self.convert(amount, base, target, date)
    # do checks before conversion
    if (amount.is_a? Numeric) && (date.is_a? Date) && Currency.bothValid(base, target)
      convertCurrencies(amount, base, target, date)
    else
      puts "ExchangeRate.convert - Wrong input arguments!"
      puts "convert(#{amount}, #{base}, #{target}, #{date})"
      puts amount.is_a? Numeric
      puts date.is_a? == Date
      puts Currency.bothValid(base, target)
    end
  end

  # private # TODO: Problem making all these methods private

  def self.convertCurrencies(amount, base, target, date)
    puts "Date:      #{date}"
    puts "Converting: #{amount} #{base} to #{target}."

    bRate = fetchRate("EUR", base, date)
    tRate = fetchRate("EUR", target, date)

    converted = (amount * tRate / bRate).round(2)

    { date: date, amount: amount, base: base, bRate: bRate, converted: converted, target: target, tRate: tRate }
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

  def self.prettyPrint(hash)
    date = hash[:date]
    amount = hash[:amount]
    base = hash[:base]
    bRate = hash[:bRate]
    converted = hash[:converted]
    target = hash[:target]
    tRate = hash[:tRate]
    "RESULTS FOR #{date}
    #{amount} #{Currency.getNameByAcronym(base)}
    = #{converted} #{Currency.getNameByAcronym(target)}

    1 #{base} = #{(tRate).round(2)} #{target}
    1 #{target} = #{(1.0/bRate).round(2)} #{base}"
  end
end
