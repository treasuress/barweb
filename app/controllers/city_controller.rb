class CityController < ApplicationController
  def index
    get_principal

    #todo now - n dxar cidad fixa akih - colokr chamada da busca dentro da view ou buscar categoria atual como na controller de categoria, talvez seja melhor tdos assim
    #todo now - talvez precise d relacionar com bar para a categoria n ficar vazia qndo aparecer
    @active_categories_with_city = Category.getCategoryWithCity("1")

    #todo now - n dxar cidad fixa akih
    #Busca para mapa
    @all_bars_from_city = HomeBar.all_by_category_and_city("1","1")
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