class PagesController < ApplicationController
  def home
    @defaultBaseId = Currency.defaultBaseId
    @defaultTargetId = Currency.defaultTargetId
  end
end
