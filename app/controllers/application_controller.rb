class ApplicationController < ActionController::Base

  helper_method :get_principal, :get_active_bars, :get_active_categories,
                :get_current_country, :get_current_state, :get_current_city, :get_current_category, :get_current_bar

  #TODO futuro - buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_principal
    @principal = Principal.all
  end

  def get_active_bars
    @all_active_bars = HomeBar.active
  end

  def get_active_categories
    @all_active_categories = Category.active
  end


  def get_current_country(country_id)
    @current_country = Country.getCountryName(country_id)
  end

  def get_current_state(state_id)
    @current_state = State.getStateName(state_id)
  end

  def get_current_city
    if !params[:city_name].nil?
      @current_city = City.find_by_name(params[:city_name])
    end
  end

  def get_current_category
    if !params[:category_name].nil?
      @current_category = Category.find_by_name(params[:category_name])
    end
  end

  def get_current_bar
    if !params[:bar_name].nil?
      @current_bar = HomeBar.find_by_name(params[:bar_name])
    end
  end


  helper_method  :get_current_city_from_bar
  def get_current_city_from_bar(city_id)
    @current_city_from_bar = City.getCityName(city_id)
  end

  #todo now - buscar estabelecimentos ativos por categoria

  protect_from_forgery
end