class PrincipalController < ApplicationController

  def index
    #TODO: buscar só a página principal ativa
    @principals = Principal.all
    #@principal = Principal.limit(1).where("active = true")

    #todo buscar aqui por tipo de estabelecimento qndo tiver mais d um tipo
    #Seleciona 8 bares aleatoriamente - slite
    #@home_bars = HomeBar.all(:order => 'RANDOM()', :limit => 7)
    #todo gambiarra
    @home_bars = HomeBar.active
    @home_bars = @home_bars.all(:order => 'RANDOM()', :limit => 7)
    #Seleciona 8 bares aleatoriamente - mysql
    #@home_bars = HomeBar.all(:order => 'RAND()', :limit => 7)


    #@home_bar = HomeBar.find(params[:name])
    @home_bar = HomeBar.find_by_name(get_current_bar_name)
    #@home_bar = HomeBar.find_by_name(params[:name])


    #Filtros de Busca
    #todo: buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo: colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    @bar_name = HomeBar.find_by_name(params[:name])

  end

  def contact

    #TODO: COLOKR BUSCA 'PRINCIPALS' EM TDAS JAH Q VAI USAR EM TDAS
    #todo: gambiarra - tirar
    @principals = Principal.all

    render('layouts/contact')
  end

end