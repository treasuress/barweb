class ApplicationController < ActionController::Base

  helper_method :get_principal, :get_active_bars, :get_active_categories,
                :get_current_country, :get_current_state, :get_current_city, :get_current_category, :get_current_bar,
                :get_current_category_by_id,
                :get_bars_from_category, :get_bars_from_category_and_city

  def get_principal
    @principal = Principal.active.first
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
    @current_state = State.getStateIso(state_id)
  end

  def get_current_city_by_id(city_id)
    @current_city = City.getCityName(city_id)
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

  def get_bars_from_category(category_id)
    @bars_from_category = HomeBar.all_by_category(category_id)
  end

  def get_bars_from_category_and_city(category_id, city_id)
    @bars_from_category_and_city = HomeBar.all_by_category_and_city(category_id, city_id)
  end

  protect_from_forgery
end