class Currency < ActiveRecord::Base
  validates_presence_of :name, :code
  validates_uniqueness_of :code, :scope => :country_id

  belongs_to :country
  delegate :visited_at, :to => :country
  
  scope :collected, joins(:country).where('countries.visited_at is not ?', nil).order('countries.visited_at')
  scope :not_collected, joins(:country).where('countries.visited_at is ?', nil)

  
  def collected?
    country.visited_at
  end

end