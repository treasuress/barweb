class CityController < ApplicationController
  def index
    get_principal
    get_active_bars

    @active_categories_with_city = Category.getCategoryWithCity("1")

    #Busca para mapa
    @all_bars_from_city = Category.getBarsWithActiveCategoryAndCity2("1")
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