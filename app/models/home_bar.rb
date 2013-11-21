class HomeBar < ActiveRecord::Base
  attr_accessible :name, :description, :logo_bar_image, :phone_number, :cellphone_number,
                  :address, :number, :complement, :zip, :neighborhood, :city, :state, :country_bar,
                  :category_id, :status_id, :country_id, :state_id, :city_id

  belongs_to :principal
  belongs_to :category
  belongs_to :status
  belongs_to :country
  belongs_to :state
  belongs_to :city

  validates_presence_of :name, :address, :number, :neighborhood, :country_id, :state_id, :city_id, :category_id, :status_id

  validates_uniqueness_of :name

  has_attached_file :logo_bar_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/home_bars/:id/images/logo_bar_:style.:extension",
                    :path => ":rails_root/public/assets/home_bars/:id/images/logo_bar_:style.:extension"

  def self.active()
    #todo now futuro - FUNCIONA - mas n acho q teja certo - c mudar id tdas as buscam ficarão erradas - o bom seria fazer o join pra pegar pelo nome, mas n deu certo
    where(:status_id => 1)
  end

  def self.inactive
    #todo now futuro - FUNCIONA - mas n acho q teja certo
    where(:status_id => 2)
  end

  def self.pending
    #todo now futuro - FUNCIONA - mas n acho q teja certo
    where(:status_id => 3)
  end

end