class HomeBarController < ApplicationController

  def index
    @home_bar = HomeBar.find_by_name(params[:name])

    get_current_country(@home_bar.country_id)
    get_current_state(@home_bar.state_id)
    get_current_city

  end

end