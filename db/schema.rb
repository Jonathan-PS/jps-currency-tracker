# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_20_193125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "timestamp"
    t.date "date"
    t.string "base_symbol"
    t.string "target_symbol"
    t.decimal "rate"
    t.boolean "historical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timestamp", "base_symbol", "target_symbol"], name: "idx_on_timestamp_base_symbol_target_symbol_5d790f527f", unique: true
  end
end
