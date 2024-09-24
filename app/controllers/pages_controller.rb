class PagesController < ApplicationController
  include RatesCalculator

# Populating database table Currencies, will only run once!
WebApi.importCurrencies


  def home
    @defaultBaseId = Currency.defaultBaseId
    @defaultTargetId = Currency.defaultTargetId
  end



  def create
    25.times { print ". " }
    puts
    puts "IN SEARCH CONTROLLER"
    puts params
    amount = params["amount"].to_f
    baseId = params["base"]["id"].to_i
    targetId = params["target"]["id"].to_i
    date = params["date"].to_date
    puts "amount: #{amount}, class: #{amount.class}"
    puts "baseId: #{baseId}, class: #{baseId.class}"
    puts "targetId: #{targetId}, class: #{targetId.class}"
    puts "date: #{date}, class: #{date.class}"

    begin
      # TODO: Stupid! We should store base and target as baseId and targetId in table ExchangeRates
      base = Currency.getAcronymById(baseId)
      target = Currency.getAcronymById(targetId)
      puts "base: #{base}, class: #{base.class}"
      puts "target: #{target}, class: #{target.class}"

      hash = RatesCalculator.convert(amount, base, target, date)

      RatesCalculator.prettyPrint(hash)

      flash[:amount] = hash[:amount]
      flash[:base] = hash[:base]
      flash[:bRate] = hash[:bRate]
      flash[:converted] = hash[:converted]
      flash[:target] = hash[:target]
      flash[:tRate] = hash[:tRate]
      redirect_to :root
    rescue => error
      p error.message
    end
  end

    def self.flashHash(hash)
  end
end
