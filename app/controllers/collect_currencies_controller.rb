class CollectCurrenciesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @collected_currencies = []
    params.each do |id, value|
      currency = current_user.currencies.find_by_id id
      if currency
        country = currency.country
        country.update_attributes :visited => value
        @collected_currencies << currency
      end
    end
  end

end
