class Country < ActiveRecord::Base

  attr_accessor :visited
  validates_presence_of :name, :code
  validates_uniqueness_of :code, :scope => :user_id

  has_many :currencies, :dependent => :destroy
  scope :visited, where('visited_at is not ?', nil)
  scope :not_visited, where(:visited_at => nil)
  
  accepts_nested_attributes_for :currencies, :allow_destroy => true
  before_validation :prepare_visited_at
  
  def visited
    @visited ||= !!visited_at
  end
      
  def prepare_visited_at
    case 
    when @visited == "1" && visited_at.nil?
      self.visited_at = DateTime.now
    when @visited == "0" && visited_at
      self.visited_at = nil
    end
  end    
end