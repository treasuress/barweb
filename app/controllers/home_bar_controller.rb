class HomeBarController < ApplicationController

  def index
    @home_bar = HomeBar.find_by_name(params[:name])
    #@home_bar = HomeBar.find_all_by_name(get_current_bar_name)
  end

  def all
    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao

    #Busca estabelecimentos - ordem alfabética
    @home_bars = HomeBar.active
    @home_bars = @home_bars.all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }
  end

end