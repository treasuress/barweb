class HomeBar < ActiveRecord::Base
  attr_accessible :name, :description, :logo_bar_image, :phone_number, :cellphone_number,
                  :address, :number, :complement, :zip, :neighborhood, :category_id, :status_id,
                  :country_id, :state_id, :city_id

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


  def self.active
    where(:status_id => Status.active)
  end

  def self.inactive
    where(:status_id => Status.inactive)
  end

  def self.pending
    where(:status_id => Status.pending)
  end

  def self.bars_from_category(category_id)
    where(:status_id => Status.active, :category_id => category_id)
  end

  #<!-- todo futuro - adicionar busca por cidad -->

end