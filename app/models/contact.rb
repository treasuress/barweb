class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :message, :name, :subject

  validates :name, :length => {:in => 2..50}
  #todo now - colokr qntidad minima d caracteres e colokr msg d erro pra isso
  validates :message, :length => {:in => 1..750}
  #validates :message, :length => {:minimumin => 10, :maximum =>750, :message => "A mensagem deve possuir no minimo 10 caracteres!"}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end