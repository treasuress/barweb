class City < ActiveRecord::Base
  attr_accessible :name, :state_id

  belongs_to :state
  has_many :home_bars

end