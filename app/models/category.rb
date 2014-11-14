class Category < ActiveRecord::Base
  attr_accessible :active, :name, :description, :category_image

  has_many :home_bars

  validates_presence_of :name

  validates_uniqueness_of :name

  has_attached_file :category_image,
                    :styles => {:home => "400x300#", :thumb => "100x100#"},
                    :url => "/assets/categories/:id/images/category_:style.:extension",
                    :path => ":rails_root/public/assets/categories/:id/images/category_:style.:extension"


  def self.active
    where(:active => true)
  end

  def self.inactive
    where(:active => false)
  end

  #ver busca de cidad em otros projs
  def self.getCategoryName(category_id)
    where(:id => category_id.to_s)["name".to_i]
  end

  def self.getActiveCategoryName(category_id)
    active.where(:id => category_id.to_s["name".to_i])
  end

  #todo seb now - verificar se busca pode ser melhorada
  #todo now - talvez precise d relacionar com bar para a categoria n ficar vazia qndo aparecer
  def self.getCategoryWithCity(city_id)
    find_by_sql("select * from cities city, categories c where c.active = true and city.id = #{city_id} group by c.name")
  end

end