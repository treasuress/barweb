class CityController < ApplicationController
  def index
    get_principal
    get_active_bars

    #todo now - ver diferenca das consultas, ver qual está certa
    #acho q a 1a está mais certa, mas precisa faze o join com a categoria pra n dar pau
    #@active_categories_with_bar = get_bars_from_city("1")
    @active_categories_with_city = Category.getCategoryWithCity("1")

    #@active_categories_with_bar = Category.getBarsWithActiveCategoryAndCity("1")
    get_bars_from_city("1")
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