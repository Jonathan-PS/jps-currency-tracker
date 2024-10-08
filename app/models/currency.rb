class Currency < ApplicationRecord
  def initialize
    # Populating database table Currencies, will only run once!
    WebApi.importCurrencies
  end 

  def acronym_with_name
    "#{acronym} - #{name}"
  end

  # ----- DB Methods ----- #

  def self.defaultBaseId
    Currency.where(acronym: "NOK").last.id
  end

  def self.defaultTargetId
    Currency.where(acronym: "USD").last.id
  end

  def self.bothValid(code1, code2)
    Currency.where(acronym: code1).exists? && Currency.where(acronym: code2).exists?
  end

    def self.getAcronymById(id)
    Currency.find(id).acronym
  end

  def self.getNameByAcronym(acronym)
    Currency.where(acronym: acronym).last.name
  end

  def self.createCurrency(name, acronym)
    Currency.create(name: name, acronym: acronym)
  end
end
