class City < ActiveRecord::Base
  attr_accessible :name, :state_id

  belongs_to :state
  has_many :home_bars
  
  validates_presence_of :name

  def self.getCityName(city_id)
    where("id = " + city_id.to_s)["name".to_i]
  end

end