class HomeBarController < ApplicationController

  def index
    @home_bar = HomeBar.find_by_name(params[:name])
    #@home_bar = HomeBar.find_all_by_name(get_current_bar_name)
  end

  def all
    #Busca aleatória por estabelecimentos - sqlite
    @home_bars = HomeBar.active
    @home_bars = @home_bars.all(:order => 'RANDOM()')
  end

end