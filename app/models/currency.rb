class Currency < ApplicationRecord

  def acronym_with_name
    "#{acronym} - #{name}"
  end

  def self.bothValid(code1, code2)
    Currency.where(acronym: code1).exists? && Currency.where(acronym: code2).exists?
  end

  def self.getName(acronym)
    Currency.where(acronym: acronym).last.name
  end

  def self.createCurrency(name, acronym)
    Currency.create(name: name, acronym: acronym)
  end
end