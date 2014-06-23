class CityController < ApplicationController
  def index
    get_principal
    get_active_bars

    @active_categories_with_bar = Category.getActiveCategoryWithBar
    #todo now! - ver pq n tah fazendo essa busca, ver o q ela retorna
    #@active_categories_with_bar = HomeBar.all_by_city(1)

  end

  def contact
    render('contact')
  end

  def terms
    render('terms')
  end

  def gallery
    render('layouts/_page_building')
  end

  def events
    render('layouts/_page_building')
  end

end