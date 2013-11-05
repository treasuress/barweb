class HomeBarController < ApplicationController

  def index

    #@home_bar = HomeBar.first

    #@home_bar = HomeBar.find_all_by_name(get_current_bar_name)

    #FUNCIONA!
    @home_bar = HomeBar.find_by_name(params[:name])
    #@home_bar = HomeBar.find(params[:name])

    #todo: gambiarra - tirar
    @principals = Principal.all

  end

end