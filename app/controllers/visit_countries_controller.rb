class VisitCountriesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @visited_countries = []
    params.each do |code, value|
      country = Country.find_by_code code
      if country
        country.visited_by_user = value
        country.change_visited_by_user(current_user)
        @visited_countries << country
      end
    end
  end

end
