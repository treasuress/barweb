class State < ActiveRecord::Base
  attr_accessible :iso, :name, :country_id

  belongs_to :country
  has_many :cities
  has_many :home_bars

  validates_presence_of :iso, :name

  def self.getStateName(state_id)
    where("id = " + state_id.to_s)["name".to_i]
  end

end