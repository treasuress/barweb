class Category < ActiveRecord::Base

  attr_accessible :active, :name, :description, :main_image

  has_many :home_bars

  validates_presence_of :name, :active

  has_attached_file :main_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/categories/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/categories/:id/images/main_:style.:extension"

end