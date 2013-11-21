class City < ActiveRecord::Base
  attr_accessible :name, :state_id

  belongs_to :state
  has_many :home_bars
  
  validates_presence_of :name, :state_id

  #todo now - mt errado, arrumar
  def self.getCityName
    City.find_by_sql("select c.name from cities c, home_bars h where 1 = c.id and h.id = 1")["name".to_i]
  end

end