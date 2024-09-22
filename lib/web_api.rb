module WebApi
  # ----- FixerIO API Methods ----- #

  def dailyImportFromFixerIO
    importFromFixer "latest"
  end

  # - TODO:
  #   - Security:
  #     - Remove access_key from source code!
  def self.importFromFixer(date)
    if ExchangeRate.importedAlready(date)
      puts "Currency rates already imported for #{date}. Skipping."
      return
    end

    puts "Importing data for #{date} from FixerIO API..."

    # base= EUR only - Free Subscription Plan Limitation
    response = RestClient.get("http://data.fixer.io/api/#{date}?access_key=xx
")
    erates = JSON.parse(response.body)

    historical = !(date == "latest" || date == Date.today)

    #  Save to DB
    erates["rates"].each do |key, value|
      ExchangeRate.createExchangeRates(erates["timestamp"], erates["date"], historical, erates["base"], key, value)
    end

    puts "Data imported!"
  end


  def self.importCurrencies
    if Currency.all.length > 0
      puts "Currency codes already imported. Skipping."
      return
    end

    response2 = RestClient.get("http://data.fixer.io/api/symbols?access_key=xx
")
    symbolsAndNames = JSON.parse(response2.body) 
    
    sortedByNamesArray  = symbolsAndNames['symbols'].to_a.sort_by{|n| n[1] }

    sortedByNamesArray.each { |s| Currency.createCurrency(s[1], s[0]) }
    
  end
end
