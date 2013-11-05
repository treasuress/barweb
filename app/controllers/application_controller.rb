class ApplicationController < ActionController::Base

  helper_method :get_current_bar_name

  def get_current_bar_name
    if !params[:name].nil?
      HomeBar.find_all_by_name(params[:name]).first
    end
  end

  protect_from_forgery
end