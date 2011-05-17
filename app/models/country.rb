class Country < ActiveRecord::Base
  set_primary_key :code
  attr_accessible :name, :code, :visited_by_user
  attr_accessor :visited_by_user

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies
  has_many :user_countries

  accepts_nested_attributes_for :currencies, :allow_destroy => true
  
  def user_country(user)
    user_countries.find_by_user_id user.id
  end
  
  def visited?(user)
    !!user_country(user)
  end
  
  def change_visited_by_user(user)
    self.user_countries.create :user => user if visited_by_user == "1" && !visited?(user)
    self.user_country(user).destroy if visited_by_user == "0" && visited?(user)
  end
end