class CategoryController < ApplicationController

  def index
    get_active_categories
  end

  def show
    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao
    #todo now - buscar apenas estabelecimentos da categoria certa
    #todo futuro - buscar apenas por categorias ativas
    #Busca estabelecimentos - ordem alfabética
    @home_bars = get_active_bars.all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }

    get_current_city
    get_current_category(@home_bars.first.category_id)
  end

end