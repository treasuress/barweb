class CityController < ApplicationController
  def index
    get_principal

    #todo now - talvez precise d relacionar com bar para a categoria n ficar vazia qndo aparecer
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