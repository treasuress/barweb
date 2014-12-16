class Country < ActiveRecord::Base
  attr_accessible :iso, :name,  :id, :country_id

  has_many :states
  has_many :home_bars

  validates_presence_of :name, :iso

  def self.getCountryName(country_id)
    where(:id => country_id.to_s)["name".to_i]
  end

end