class HomeBarController < ApplicationController

  def index
    @home_bar = HomeBar.find_by_name(params[:name])

    get_current_country(@home_bar.country_id)
    get_current_state
    get_current_city

  end

  def all

    get_current_city
    get_current_category

    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao

    #todo futuro - buscar apenas por categorias ativas
    #Busca estabelecimentos - ordem alfabética
    @home_bars = get_active_bars.all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }
  end

end