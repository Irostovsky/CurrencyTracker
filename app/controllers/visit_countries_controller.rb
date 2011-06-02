class VisitCountriesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @visited_countries = []
    params.each do |id, value|
      country = current_user.countries.find_by_id id
      if country
        country.update_attributes :visited => value
        @visited_countries << country
      end
    end
  end

end
