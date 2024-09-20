require "application_system_test_case"

class ExchangeRatesTest < ApplicationSystemTestCase
  setup do
    @exchange_rate = exchange_rates(:one)
  end

  test "visiting the index" do
    visit exchange_rates_url
    assert_selector "h1", text: "Exchange rates"
  end

  test "should create exchange rate" do
    visit exchange_rates_url
    click_on "New exchange rate"

    fill_in "base_symbol", with: @exchange_rate.base_symbol
    fill_in "Date", with: @exchange_rate.date
    fill_in "Rate", with: @exchange_rate.rate
    fill_in "target_symbol", with: @exchange_rate.target_symbol
    fill_in "Timestamp", with: @exchange_rate.timestamp
    click_on "Create Exchange rate"

    assert_text "Exchange rate was successfully created"
    click_on "Back"
  end

  test "should update Exchange rate" do
    visit exchange_rate_url(@exchange_rate)
    click_on "Edit this exchange rate", match: :first

    fill_in "base_symbol", with: @exchange_rate.base_symbol
    fill_in "Date", with: @exchange_rate.date
    fill_in "Rate", with: @exchange_rate.rate
    fill_in "target_symbol", with: @exchange_rate.target_symbol
    fill_in "Timestamp", with: @exchange_rate.timestamp
    click_on "Update Exchange rate"

    assert_text "Exchange rate was successfully updated"
    click_on "Back"
  end

  test "should destroy Exchange rate" do
    visit exchange_rate_url(@exchange_rate)
    click_on "Destroy this exchange rate", match: :first

    assert_text "Exchange rate was successfully destroyed"
  end
end
