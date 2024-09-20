class CreateExchangeRates < ActiveRecord::Migration[7.2]
  def change
    create_table :exchange_rates do |t|
      t.bigint :timestamp
      t.date :date
      t.string :base_symbol
      t.string :target_symbol
      t.decimal :rate
      t.boolean :historical

      t.timestamps
    end
  end
end
