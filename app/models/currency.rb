class Currency < ActiveRecord::Base
  set_primary_key :code
  attr_accessible :name, :code, :country_id

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  belongs_to :country

  def self.collected(user)
    all.select {|currency| currency.collected?(user) }
  end

  def self.not_collected(user)
    all.reject {|currency| currency.collected?(user) }
  end

  def collected?(user)
    country.nil? ? false : country.visited?(user)
  end
end