class HomeBarController < ApplicationController

  def index
    get_current_bar

    get_current_country(@current_bar.country_id)
    get_current_state(@current_bar.state_id)
    get_current_city
  end

end