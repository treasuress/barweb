class PrincipalController < ApplicationController

  def index
    get_principal

    #todo futuro - talvez dah pra colokr até rand() em application pra poder usar em homeBar/all qndo for buscar randomicamente lá
    #todo futuro - futuro buscar aqui por categoria de estabelecimento - qndo tiver mais d uma categoria
    #Seleciona 7 bares aleatoriamente - mysql
    @home_bars = get_active_bars.all(:order => 'RAND()', :limit => 7)


    #@home_bar = HomeBar.find_by_name(get_current_bar_name)


    #Filtros de Busca
    #todo futuro - acho q dev fikr em application e passar o resultado pra renderizadao do header já q a busca ficará lá
    #todo futuro - buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo futuro - colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    @bar_name = HomeBar.find_by_name(params[:name])

    #todo now - preciso pegar tdos os ids dinamicament, como faz?
    get_current_city_from_bar(@all_active_bars.first.city_id)

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