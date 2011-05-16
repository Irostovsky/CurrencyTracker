class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :user_countries
  
  def visited_countries_count
    user_countries.size
  end
  
  def not_visited_countries_count
    Country.count - visited_countries_count
  end
  
end
