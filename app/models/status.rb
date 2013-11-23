class Status < ActiveRecord::Base
   attr_accessible :name

   validates_presence_of :name

   #todo now - fazer teste para isso
   validates_uniqueness_of :name

   has_many :home_bars

   #Status dos Estabelecimentos

   def active?
     name == 'ativo'
   end

   def inactive?
     name == 'inativo'
   end

   def pending?
     name == 'pendente'
   end

   def self.active
     self.find_all_by_name('ativo')
   end

   def self.inactive
     self.find_all_by_name('inativo')
   end

   def self.pending
     self.find_all_by_name('pendente')
   end

end