class CategoryController < ApplicationController

  def index
    get_active_categories
  end

  def show
    #todo now - ver como procurar cidade corrent - ver se só descomentar metodo do application resolv
    get_current_city
    get_current_category

    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao
    #Busca estabelecimentos por categoria - ordem alfabética
    if(!@current_category.nil?)
      @all_bars_from_category_and_city = get_bars_from_category_and_city(@current_category.id, @current_city.id).all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }
    end
  end

end