class PrincipalController < ApplicationController

  def index
    get_principal

    @active_categories = Category.active


    #@home_bar = HomeBar.find_by_name(get_current_bar_name)

    #Filtros de Busca
    #todo futuro - buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo futuro - colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    #@bar_name = HomeBar.find_by_name(params[:name])


    #Busca para mapa
    @all_bars_from_active_categories = Category.getBarsWithActiveCategory
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