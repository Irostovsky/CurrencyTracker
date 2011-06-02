class CountriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_countries
  before_filter :find_country, :except => :index
  
 
  def index
  end

  def show
  end

  def edit
  end

  def update
    
    if @country.update_attributes params[:country] 
      redirect_to @country, :notice => 'Country was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
private
  
  def find_countries
    @countries = current_user.countries
  end
  
  def find_country
    @country = @countries.find params[:id]
  end
      
end