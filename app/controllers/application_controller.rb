class ApplicationController < ActionController::Base

  helper_method :get_principal, :get_active_categories,
                :get_bars_from_category_limit, :get_bars_from_category_and_city, :get_bars_from_category_and_city_limit,
                :get_current_country, :get_current_state, :get_current_city, :get_current_category, :get_current_bar,
                :get_current_category_by_id,
                :get_current_city_by_home_bar


  #todo now - verificar quais buscas estao sendo usadas em mais d uma pagina,
  #as q estiverem, continuam aqui, as q n estiverem, colokr na pagina adequada

  def get_principal
    @principal = Principal.active.first
  end

  def get_active_categories
    @all_active_categories = Category.active
  end

  #Seleciona 7 bares aleatoriamente de cada categoria - mysql
  def get_bars_from_category_limit(category_id)
    @all_bars_from_category = HomeBar.all_by_category(category_id).all(:order => 'RAND()', :limit => 7)
  end

  #Seleciona 7 bares aleatoriamente de cada categoria e cidade - mysql
  def get_bars_from_category_and_city_limit(category_id, city_id)
    @all_bars_from_category = HomeBar.all_by_category_and_city(category_id, city_id).all(:order => 'RAND()', :limit => 7)
  end

  def get_bars_from_category_and_city(category_id, city_id)
    @all_bars_from_category_and_city = HomeBar.all_by_category_and_city(category_id, city_id)
  end

  def get_current_country(country_id)
    @current_country = Country.getCountryName(country_id)
  end

  def get_current_state(state_id)
    @current_state = State.getStateIso(state_id)
  end

  def get_current_city_by_id(city_id)
    @current_city_by_id = City.getCityName(city_id)
  end

  def get_current_city
    if !params[:city_name].nil?
      @current_city = City.find_by_name(params[:city_name])
    end
  end

  def get_current_city_by_home_bar(home_bar_name)
    @current_city_by_home_bar = City.find_by_home_bar(home_bar_name)
  end

  def get_current_category
    if !params[:category_name].nil?
      @current_category = Category.find_by_name(params[:category_name])
    end
  end

  def get_current_category_by_id(category_id)
      @current_category_by_id = Category.getCategoryName(category_id)
  end


  #helper_method :get_current_active_category_name
  #def get_current_active_category_name(category_id)
  #  @activeCategoryName = Category.getActiveCategoryName(category_id)
  #end

  def get_current_bar
    if !params[:bar_name].nil?
      @current_bar = HomeBar.find_by_name(params[:bar_name])
    end
  end


  protect_from_forgery
end