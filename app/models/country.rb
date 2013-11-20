class Country < ActiveRecord::Base
  attr_accessible :iso, :name

  has_many :states
  has_many :home_bars

end