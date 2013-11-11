class PrincipalController < ApplicationController

  def index
    #todo gambiarra - tirar (consegui tirar dos outros, n sei pq n deu certo akih)
    @principals = Principal.all

    #todo futuro buscar aqui por tipo de estabelecimento - qndo tiver mais d um tipo
    #Seleciona 7 bares aleatoriamente - slite
    @home_bars = HomeBar.active
    @home_bars = @home_bars.all(:order => 'RANDOM()', :limit => 7)
    #Seleciona 7 bares aleatoriamente - mysql
    #@home_bars = HomeBar.active
    #@home_bars = @home_bars.all(:order => 'RAND()', :limit => 7)


    #@home_bar = HomeBar.find(params[:name])
    @home_bar = HomeBar.find_by_name(get_current_bar_name)
    #@home_bar = HomeBar.find_by_name(params[:name])


    #Filtros de Busca
    #todo: buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo: colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    @bar_name = HomeBar.find_by_name(params[:name])

  end

  def contact
    render('layouts/contact')
  end

end