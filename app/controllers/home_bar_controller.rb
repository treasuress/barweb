class HomeBarController < ApplicationController

  def index
    @home_bar = HomeBar.find_by_name(params[:name])


    #todo now - ver se dah pra colokr em application
    #todo now - mt errado, arrumar
    @home_bar_country = Country.getCountryName
    #@home_bar_country = Country.getCountryName(params[:id],params[:id])
    #@home_bar_country = Country.getCountryName(1, 1)

    @home_bar_state = State.getStateName
    @home_bar_city = City.getCityName

  end

  def all
    @home_all_active_bars = HomeBar.active

    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao

    #todo futuro - buscar apenas por categorias ativas
    #Busca estabelecimentos - ordem alfabética
    @home_bars = @home_all_active_bars.all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }
  end

end