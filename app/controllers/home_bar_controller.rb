class HomeBarController < ApplicationController

  def index

    @home_bar = HomeBar.find_by_name(params[:name])

    #@home_bar = HomeBar.find_all_by_name(get_current_bar_name)

    #todo: gambiarra - tirar
    @principals = Principal.all

  end

  def all

    #todo: gambiarra - tirar
    @principals = Principal.all

    #Busca aleatória por estabelecimentos - sqlite
    @home_bars = HomeBar.all(:order => 'RANDOM()')
  end

end