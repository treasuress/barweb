class CategoryController < ApplicationController

  def index
    get_active_categories
  end

  def show
    #todo now - ver como procurar cidade corrent - ver se só descomentar metodo do application resolv
    #todo now - ver se tem pagina pra outra cidad já criada, tem q criar qndo add cidad no script
    get_current_city
    get_current_category

    #todo futuro - colokr busca aleatoria aqui qndo for colokr varios tipos d ordenacao
    #Busca estabelecimentos por categoria - ordem alfabética
    if(!@current_category.nil?)
      @bars_from_category = get_bars_from_category(@current_category.id).all.sort! { |a, b| a['name'].downcase <=> b['name'].downcase }
    end
  end

end