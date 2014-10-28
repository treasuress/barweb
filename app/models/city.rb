class City < ActiveRecord::Base
  attr_accessible :state_id, :name,    :id, :state

  belongs_to :state
  has_many :home_bars

  #belongs_to :principal   ?

  validates_presence_of :name

  def self.getCityName(city_id)
    where("id = " + city_id.to_s)["name".to_i]
  end

  def self.find_by_home_bar(home_bar_name)
    find_by_sql("select c.name from cities c, home_bars h where c.id = h.city_id and h.name = '#{home_bar_name}' ").first.name
  end

end