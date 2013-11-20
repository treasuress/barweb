class State < ActiveRecord::Base
  attr_accessible :iso, :name, :country_id

  belongs_to :country
  has_many :cities
  has_many :home_bars

end