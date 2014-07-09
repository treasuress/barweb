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

  def self.getCategoryName(category_id)
    where(:id => category_id.to_s)["name".to_i]
  end

  def self.getActiveCategoryName(category_id)
    active.where(:id => category_id.to_s["name".to_i])
  end

  def self.getActiveCategoryWithBar
    find_by_sql("select * from home_bars h, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id group by c.name")
  end

  #todo now - ver q q tah retornando aqui
  #todo - busca parecida no show da categoria
  def self.getBarsWithActiveCategoryAndCity(city_id)
    find_by_sql("select * from home_bars h, cities city, categories c where c.active = true and c.id = h.category_id and city.id = h.city_id and city.id = " + city_id + " group by c.name")
  end

end