# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


# ------ STARTUP Import FixerIO symbols (only once ever on server) and latest rates ------ #

puts "Startup stuff happening now..."

# Populating database table Currencies, will only run once!
WebApi.importCurrencies

# This will only import new rates into db when today has not already been imported:
WebApi.importFromFixer Date.today

puts "Startup stuff done!"
