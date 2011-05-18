class CollectCurrenciesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @collected_currencies = []
    params.each do |code, value|
      currency = Currency.find_by_code(code)
      if currency
        country = currency.country
        country.visited_by_user = value
        country.change_visited_by_user(current_user)
        @collected_currencies << currency
      end
    end
  end

end
