class UserCountry < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :country
  
  def created_day
    created_at.to_date
  end  
end
