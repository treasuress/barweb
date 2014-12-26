class Principal < ActiveRecord::Base
  attr_accessible :title, :description, :logo_image, :gallery_image, :events_image, :contact_image,
                  :follow_fb_image, :follow_tw_image, :active

  has_many :cities

  validates_presence_of :title

  validates_attachment_presence :logo_image, :gallery_image, :events_image, :contact_image, :follow_fb_image, :follow_tw_image

  has_attached_file :logo_image,
                    :styles => {:medium => "1000x150#"},
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


  before_save :verify_actives


  def change_status!
    self.active = !self.active?
    save!
  end

  def active_status_name
    self.active? ? I18n.t('active_admin.active') : I18n.t('active_admin.inactive')
  end


  #Buscas
  def self.active
    where(:active => true)
  end

  def self.inactive
    where(:active => false)
  end



  private

  #TODO we futuro: - PERMITIR QUE APENAS UMA FIQUE ATIVA - antes d gravar, buscar tdos e ver se tem algum ativo
  def verify_actives
    unique = Principal.active
    if unique != 0

      #if confirm("Apenas 1 página principal deve permanecer ativa, desaja que esta seja a página principal ativa?")
      #  unique.active = false
      #end

      #link_to ("Mudar"), change_status_admin_principal_path(unique), :method => :put, :data => { :confirm => "Apenas 1 principal pode permanecer ativa. Deseja que esta seja a principal ativa?" }, :class => "member_link view_link"

      #unique.active = false

      #errors[:active] = Principal.active.first.active

    else

      #errors[:active] = unique
    end
  end


end