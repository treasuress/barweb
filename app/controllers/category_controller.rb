class CategoryController < ApplicationController

  def index
    get_active_categories
  end

  def show
    get_current_city
    get_current_category

    #todo now - buscar apenas estabelecimentos da categoria certa
    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao
    #Busca estabelecimentos - ordem alfabética
    @home_bars = get_active_bars.all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }

  end

end