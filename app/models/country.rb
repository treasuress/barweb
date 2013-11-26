class Country < ActiveRecord::Base
  attr_accessible :iso, :name

  has_many :states
  has_many :home_bars

  validates_presence_of :name, :iso

  def self.getCountryName(country_id)
     Country.find_by_sql("select name from countries where id = " + country_id.to_s)["name".to_i]
  end

end