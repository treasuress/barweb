class HomeBar < ActiveRecord::Base
  attr_accessible :name, :description, :main_image, :phone_number, :cellphone_number,
                  :address, :number, :complement, :zip, :neighborhood, :city, :state, :country_bar,
                  :category_id

  belongs_to :principal
  belongs_to :category

  has_attached_file :main_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/home_bars/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/home_bars/:id/images/main_:style.:extension"


  #TODO: VERIFICAR QUAIS CAMPOS DEVEM SER OBRIGATORIOS
  validates_attachment_presence :main_image
  validates_presence_of :name, :address, :number
end