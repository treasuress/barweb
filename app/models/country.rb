class Country < ActiveRecord::Base
  attr_accessible :iso, :name

  has_many :states
  has_many :home_bars

  validates_presence_of :name, :iso

  #todo now - mt errado, arrumar
  def self.getCountryName
     Country.find_by_sql("select c.name from countries c, home_bars h where 1 = c.id and h.id = 1")["name".to_i]
  end

  #def self.getCountryName(country_id, bar_id)
  #  Country.find_by_sql("select c.name from countries c, home_bars h where 1 = ? and h.id = ?", country_id, bar_id)["name".to_i]
  #end

end