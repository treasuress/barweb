class Principal < ActiveRecord::Base
  attr_accessible :title, :description, :logo_image, :gallery_image, :events_image, :contact_image,
                  :follow_fb_image, :follow_tw_image, :all_homes_image, :active

  has_many :home_bars

  validates_presence_of :title

  validates_attachment_presence :logo_image, :gallery_image, :events_image, :contact_image, :follow_fb_image, :follow_tw_image, :all_homes_image

  #todo now futuro - ver se tem como validar tamanho da img pra add, senao o layout n fik igual
  #todo seb now - colokr tamanho certo da logo
  has_attached_file :logo_image,
                    :styles => {:medium => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/principals/:id/images/logo_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/logo_:style.:extension"
  has_attached_file :gallery_image,
                    :styles => {:thumb => "100x100#"},
                    :url => "/assets/principals/:id/images/gallery_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/gallery_:style.:extension"
  has_attached_file :events_image,
                    :styles => {:thumb => "100x100#"},
                    :url => "/assets/principals/:id/images/events_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/events_:style.:extension"
  has_attached_file :contact_image,
                    :styles => {:thumb => "100x100#"},
                    :url => "/assets/principals/:id/images/contact_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/contact_:style.:extension"
  has_attached_file :follow_fb_image,
                    :styles => {:thumb => "100x45#"},
                    :url => "/assets/principals/:id/images/follow_fb_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/follow_fb_:style.:extension"
  has_attached_file :follow_tw_image,
                    :styles => {:thumb => "100x45#"},
                    :url => "/assets/principals/:id/images/follow_tw_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/follow_tw_:style.:extension"
  has_attached_file :all_homes_image,
                    :styles => {:thumb => "100x45#"},
                    :url => "/assets/principals/:id/images/all_homes_:style.:extension",
                    :path => ":rails_root/public/assets/principals/:id/images/all_homes_:style.:extension"

  def self.active
    where(:active => true)
  end

  def self.inactive
    where(:active => false)
  end

  #TODO we futuro - PERMITIR QUE APENAS UMA FIQUE ATIVA
end