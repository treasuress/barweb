class CategoryController < ApplicationController

  def index
    get_active_categories
  end

  def show
    get_current_city
    get_current_category

    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao
    #Busca estabelecimentos por categoria - ordem alfabética
    @bars_from_category = get_bars_from_category(@current_category.id).all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }

    #todo fim now - qndo a pessoa poe uma categoria q n estah cadastrada no banco, na url, dah um erro mt fei

  end

end