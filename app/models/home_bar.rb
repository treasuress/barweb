class HomeBar < ActiveRecord::Base
  attr_accessible :name, :description, :logo_bar_image, :phone_number, :cellphone_number,
                  :address, :number, :complement, :zip, :neighborhood, :category_id, :status_id,
                  :country_id, :state_id, :city_id

  belongs_to :category
  belongs_to :status
  belongs_to :city
  belongs_to :state
  belongs_to :country

  validates_presence_of :name, :address, :number, :neighborhood, :country_id, :state_id, :city_id, :category_id, :status_id

  #todo now - arrumar validacao para 4 ou 5 digitos no comeco do numero
  validates_format_of :phone_number, :cellphone_number, :allow_blank => true, :with => /\A\(\d{3}\) \d{4}\-\d{4,5}\Z/, :message => "Formato correto: (099) 9999-9999 ou (099) 99999-9999"
  validates_format_of :zip, :allow_blank => true, :with => /\A\d{2}.\d{3}\-\d{3}\Z/, :message => "Formato correto: 38.400-000"

  validates_presence_of :phone_number, :if => Proc.new { |bar| bar.cellphone_number.present? }

  has_attached_file :logo_bar_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/home_bars/:id/images/logo_bar_:style.:extension",
                    :path => ":rails_root/public/assets/home_bars/:id/images/logo_bar_:style.:extension"

  #todo now seb - antes de salvar o bar, verificar se já tem um com o nome q está sendo salvo, se tiver, add um 2 no fim do nome?

  #Buscas
  def self.active
    where(:status_id => Status.active)
  end

  def self.inactive
    where(:status_id => Status.inactive)
  end

  def self.pending
    where(:status_id => Status.pending)
  end


  #todo now seb - tentar n dxar fixo - buscar pelo nome do arquivo d traducoes e fazer join com a tabela de status
  #ou usar as buscar no Status
  #Status dos Estabelecimentos
  def bar_active?
    status_id == 1
  end

  def bar_inactive?
    status_id == 2
  end

  def bar_pending?
    status_id == 3
  end

  #todo now - ver se consigo mudar status do bar com isso
  def self.change_home_bar_status(status_id)
    #self.status_id == status_id

    home_bar_by_status = HomeBar.find_or_initialize_by_status_id [:status_id]
    home_bar_by_status = status_id
    #self.status_id == status_id
  end

  #todo now - assim q eh feita mudanca d status da principal, dev ajudar em algo
  def change_status!
    self.active = !self.active?
    save!
  end
  def active_status_name
    self.bar_pending? ? I18n.t('activerecord.attributes.home_bar.activate') : I18n.t('activerecord.attributes.home_bar.keep_pending')
  end

  #Principal
  def self.all_by_category(category_id)
    active.where(:category_id => category_id)
  end

  def self.getActiveBarsWithActiveCategories
    HomeBar.active.joins(:category).where(:'categories.active' => true)
  end

  #Cidade
  def self.all_by_category_and_city(category_id, city_id)
    HomeBar.getActiveBarsWithActiveCategories.where(:category_id => category_id, :city_id => city_id)
  end

  def self.all_by_city(city_id)
    HomeBar.getActiveBarsWithActiveCategories.where(:city_id => city_id)
  end

end