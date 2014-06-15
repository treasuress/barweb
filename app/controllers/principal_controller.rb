class PrincipalController < ApplicationController

  #todo now - fazer busca com tdu q precisa ao inves d fazer um mont d consultas.
  #fazer consulta q pega td q precisa pra usar akih

  def index
    get_principal
    get_active_bars

    @active_categories_with_bar = Category.getActiveCategoryWithBar

    #@home_bar = HomeBar.find_by_name(get_current_bar_name)

    #Filtros de Busca
    #todo futuro - acho q dev fikr em application e passar o resultado pra renderizadao do header já q a busca ficará lá
    #todo futuro - buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo futuro - colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    #@bar_name = HomeBar.find_by_name(params[:name])
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