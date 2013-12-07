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

  #todo now - colokr um desse com without em endereço, para n ter numeros no endereço
  validates_format_of :phone_number, :cellphone_number, :allow_blank => true, :with => /\A\(\d{3}\) \d{4,5}-\d{4}\Z/, :message => "Formato correto: (099) 9999-9999 ou (099) 09999-9999"
  validates_format_of :zip, :allow_blank => true, :with => /\A\d{5}-\d{3}\Z/, :message => "Formato correto: 38400-000"

  has_attached_file :logo_bar_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/home_bars/:id/images/logo_bar_:style.:extension",
                    :path => ":rails_root/public/assets/home_bars/:id/images/logo_bar_:style.:extension"


  #todo now futuro - verificar se cel estah em branco, c n estiver, verifica c tel está em branco, c estiver, falar q tem q preencher o 1o campo 1o
  #ou mostrar só um campo e qndo o 1o for preenchido, mostrar o 2o

  def self.active
    where(:status_id => Status.active)
  end

  def self.inactive
    where(:status_id => Status.inactive)
  end

  def self.pending
    where(:status_id => Status.pending)
  end

  def self.all_by_category(category_id)
    where(:status_id => Status.active, :category_id => category_id)
  end

  #<!-- todo futuro - adicionar busca por cidad -->

end