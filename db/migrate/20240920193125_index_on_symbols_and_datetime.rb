class IndexOnSymbolsAndDatetime < ActiveRecord::Migration[7.2]
  def change
    add_index :exchange_rates, [ :timestamp, :base_symbol, :target_symbol ], unique: true
  end
end
