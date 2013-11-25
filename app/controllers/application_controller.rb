class ApplicationController < ActionController::Base

  helper_method :get_principal_data, :get_active_bars, :get_active_categories,
                :get_current_country, :get_current_state, :get_current_city, :get_current_category
                :get_current_bar_name

  #TODO futuro - buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_principal_data
    @principals = Principal.all
  end

  #todo now - acho q jah devia relacionar apanas as categorias ativas já q as inativas n importam
  def get_active_bars
    @all_active_bars = HomeBar.active
  end

  def get_active_categories
    @all_active_categories = Category.active
  end


  def get_current_country(country_id)
    @home_bar_country = Country.getCountryName(country_id)
  end

  def get_current_state
    @home_bar_state = State.getStateName
  end

  def get_current_city
    @home_bar_city = City.getCityName
    #if !params[:name].nil?
    #  @home_bar_city = City.find_all_by_name(params[:name]).first
    #end
  end

  def get_current_category
    @home_bar_category = Category.getCategoryName
  end

  def get_current_bar_name
    if !params[:name].nil?
      HomeBar.find_all_by_name(params[:name]).first
    end
  end



  helper_method :get_bars

  def get_bars
    @bars = HomeBar.active
  end

  protect_from_forgery
end