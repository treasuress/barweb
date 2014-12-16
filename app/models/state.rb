class State < ActiveRecord::Base
  attr_accessible :iso, :name, :country_id,   :id, :country

  belongs_to :country
  has_many :cities
  has_many :home_bars   #todo now - ver se precisa disso - se precisar, add no bd

  validates_presence_of :iso, :name

  def self.getStateIso(state_id)
    where(:id => state_id.to_s)["iso".to_i]
  end

end