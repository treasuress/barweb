class PrincipalController < ApplicationController

  def index
    get_principal
    get_active_bars

    @active_categories_with_bar = Category.getActiveCategoryWithBar


    #todo futuro - talvez dah pra colokr até rand() em application pra poder usar em homeBar/all qndo for buscar randomicamente lá
    #Seleciona 7 bares aleatoriamente - mysql

    #todo now -
    #preciso de 7 bares de cada categoria

    @active_categories_with_bar.each_with_index do |category, index|
      #todo now - acho q tem q gravar em um vetor e pegar em vetor na index dps
      @home_bars = get_bars_from_category(index).all(:order => 'RAND()', :limit => 7)
    end


      #@home_bars = get_bars_from_category(@active_categories_with_bar)




    #@home_bar = HomeBar.find_by_name(get_current_bar_name)


    #Filtros de Busca
    #todo futuro - acho q dev fikr em application e passar o resultado pra renderizadao do header já q a busca ficará lá
    #todo futuro - buscar todos os bares ATIVOS que contem o que a pessoa digitar
    #todo futuro - colokr no fim dos resultados - link para lista completa de bares e criar uma otra pagina pra mostrar todos os resultados
    #@bar_name = HomeBar.find_by_name(params[:name])

    #todo now - preciso pegar tdos os ids de cidades, como faz? - acho q tem q fazer a busca junto com a q busca os bares pra ser cidad do bar certo
    get_current_city_from_bar(@all_active_bars.first.city_id)

  end

  def contact
    render('contact')
  end

  def terms
    render('terms')
  end

  def gallery
    render('layouts/_page_building')
  end

  def events
    render('layouts/_page_building')
  end

end