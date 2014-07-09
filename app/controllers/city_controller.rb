class CityController < ApplicationController
  def index
    get_principal
    get_active_bars

    #todo now - está retornando bar q n é d udia (no banco retorna certo)
    #@active_categories_with_bar = Category.getBarsWithActiveCategoryAndCity("1")
    get_bars_from_city("1")

    #todo now - ver diferenca das consultas, ver qual está certa
    #@active_categories_with_bar = get_bars_from_city("1")
    @active_categories_with_bar = Category.getBarsWithActiveCategoryAndCity("1")

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