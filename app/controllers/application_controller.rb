class ApplicationController < ActionController::Base

  helper_method :get_principal_data, :get_current_bar_name, :get_active_bars

  #TODO futuro - buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_principal_data
    @principals = Principal.all
  end

  def get_current_bar_name
    if !params[:name].nil?
      HomeBar.find_all_by_name(params[:name]).first
    end
  end

  def get_active_bars
    @all_active_bars = HomeBar.active
  end

  helper_method :get_current_country, :get_current_state, :get_current_city
  def get_current_country
    @home_bar_country = Country.getCountryName
  end

  def get_current_state
    @home_bar_state = State.getStateName
  end

  def get_current_city
    @home_bar_city = City.getCityName
  end


  helper_method :get_bars

  def get_bars
    @bars = HomeBar.active
  end

  protect_from_forgery
end