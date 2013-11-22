class State < ActiveRecord::Base
  attr_accessible :iso, :name, :country_id

  belongs_to :country
  has_many :cities
  has_many :home_bars

  validates_presence_of :iso, :name

  #todo now - mt errado, arrumar
  def self.getStateName
    State.find_by_sql("select s.name from states s, home_bars h where 1 = s.id and h.id = 1")["name".to_i]
  end

end