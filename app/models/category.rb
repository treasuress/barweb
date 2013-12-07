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
    where(:active => true, :id => category_id.to_s["name".to_i])
  end

  def self.getCategoryWithBar
    #todo futuro - melhorar busca
    find_by_sql("select c.name from categories c, home_bars h where c.id = h.category_id group by c.name")["name".to_i]
  end

end