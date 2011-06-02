class CurrenciesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_currencies

  def index
  end

  def show
    @currency = @currencies.find params[:id]
  end
  
private
  
  def find_currencies
    @currencies = current_user.currencies
  end
  
end