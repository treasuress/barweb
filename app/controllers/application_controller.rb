class ApplicationController < ActionController::Base

  helper_method :get_header_data

  #TODO: buscar só a página principal ativa
  #@principal = Principal.limit(1).where("active = true")
  def get_header_data
    @principals = Principal.all
  end

  helper_method :get_current_bar_name

  def get_current_bar_name
    if !params[:name].nil?
      HomeBar.find_all_by_name(params[:name]).first
    end
  end

  protect_from_forgery
end