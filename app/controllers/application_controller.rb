class ApplicationController < ActionController::Base

  helper_method :get_principal_data, :get_active_bars, :get_active_categories,
                :get_current_country, :get_current_state, :get_current_city, :get_current_category, :get_current_bar_name

  #TODO futuro - buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_principal_data
    @principal = Principal.all
  end

  #todo now - acho q jah devia relacionar apanas as categorias ativas já q as inativas n importam
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
    @current_city = City.getCityName
    #if !params[:name].nil?
    #  @current_city = City.find_all_by_name(params[:name]).first
    #end
  end

  def get_current_category
    if !params[:name].nil?
      @current_category = Category.find_all_by_name(params[:name]).first
    end
  end

  #todo now - ver se usa em algum lugar
  def get_current_bar_name
    if !params[:name].nil?
      HomeBar.find_all_by_name(params[:name]).first
    end
  end

  protect_from_forgery
end