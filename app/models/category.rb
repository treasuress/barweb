class Category < ActiveRecord::Base
  attr_accessible :active, :name, :description, :category_image

  has_many :home_bars #todo now categoria n tem varios bares, a cidad q tem. categoria tem varias cidads

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

  #todo now - verificar tdas essas buscas c deviam estar aqui, se estao sendo usadas e se podem ser melhoradas

  #todo now - ver forma melhor d procurar por homeBars ativos
  def self.getActiveCategoryWithBar
    find_by_sql("select * from home_bars h, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id group by c.name")
  end

  #todo now - correto - verificar se deve ficar aqui ou na model de home_bars
  def self.getBarsWithActiveCategory
    find_by_sql("select * from home_bars h, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id")
    #HomeBar.active.joins(:category).where(:category_id => true).where(:category_id => "home_bars.home_bars_id")
    #HomeBar.active.where(:category_id => true, :category_id => "home_bars.home_bars_id")

    #HomeBar.active.joins {category}.where{ (:category_id == true) & (:category_id == "home_bars.home_bars_id") }
  end

  #todo now - ver forma melhor d procurar por homeBars ativos
  #todo now - ver q q tah retornando aqui
  #todo - busca parecida no show da categoria
  def self.getBarsWithActiveCategoryAndCity(city_id)
    #retorna soh os restaurantes no banco, mas na tela retorna ok
    find_by_sql("select * from home_bars h, cities city, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id and city.id = h.city_id and city.id = " + city_id + " group by c.name")
    #retorna ok no banco, mas na tela n
    #find_by_sql("select * from home_bars h, cities city, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id and city.id = h.city_id and city.id = " + city_id )
  end

  def self.getBarsWithActiveCategoryAndCity2(city_id)
    #retorna soh os restaurantes no banco, mas na tela retorna ok
    find_by_sql("select * from home_bars h, cities city, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id and city.id = h.city_id and city.id = " + city_id)
    #retorna ok no banco, mas na tela n
    #find_by_sql("select * from home_bars h, cities city, categories c where c.active = true and h.status_id = 1 and c.id = h.category_id and city.id = h.city_id and city.id = " + city_id )
  end

  def self.getCategoryWithCity(city_id)
    find_by_sql("select * from cities city, categories c where c.active = true and city.id = " + city_id + " group by c.name")
  end

end