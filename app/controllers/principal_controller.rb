class PrincipalController < ApplicationController

  def index
    #todo now - gambiarra - tirar (consegui tirar dos outros, n sei pq n deu certo akih)
    @principals = Principal.all

    #todo futuro - futuro buscar aqui por categoria de estabelecimento - qndo tiver mais d uma categoria
    #Seleciona 7 bares aleatoriamente - mysql
    #todo now futuro - ver se dah pra colokr essa busca na application e chamar ela qndo precisar - jah q precisa na principal e na home bar
    @home_bars = HomeBar.active
    @home_bars = @home_bars.all(:order => 'RAND()', :limit => 7)


    @home_bar = HomeBar.find_by_name(get_current_bar_name)


    #Filtros de Busca
    #todo futuro - buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo futuro - colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    @bar_name = HomeBar.find_by_name(params[:name])


    #todo now - ver se dah pra colokr essas buscas na application
    #todo now - mt errado, arrumar
    @home_bar_city = City.getCityName
  end

  def contact
    render('layouts/contact')
  end

  def terms
    render('layouts/terms')
  end

  def gallery
    render('layouts/page_building')
  end

  def events
    render('layouts/page_building')
  end

end