class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :countries, :dependent => :destroy
  has_many :currencies, :through => :countries
  after_create :update_data
  
  def visited_countries_count
    user_countries.size
  end
  
  def not_visited_countries_count
    Country.count - visited_countries_count
  end

  def update_data
    res = DataUpdater.instance.parsed_response
    res[:countries].each do |attrs|
      self.countries.create attrs unless self.countries.find_by_code attrs[:code]
    end
    
    res[:currencies].each do |attrs|
       unless self.countries.find_by_code attrs[:code]
         country = self.countries.find_by_code attrs.delete(:country_id)
         country.currencies.create attrs if country
       end
    end
  end
end
