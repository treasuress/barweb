class ApplicationController < ActionController::Base

  helper_method :get_header_data, :get_current_bar_name

  #TODO futuro - buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_header_data
    @principals = Principal.all
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