class City < ActiveRecord::Base
  attr_accessible :state_id, :name,    :id, :state

  belongs_to :state
  has_many :home_bars

  #belongs_to :principal   ?

  validates_presence_of :name

  def self.getCityName(city_id)
    where("id = " + city_id.to_s)["name".to_i]
  end

end