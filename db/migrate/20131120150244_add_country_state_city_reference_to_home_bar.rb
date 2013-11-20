class AddCountryStateCityReferenceToHomeBar < ActiveRecord::Migration
  def up
    add_column :home_bars, :country_id, :integer
    add_column :home_bars, :state_id, :integer
    add_column :home_bars, :city_id, :integer
  end
  def down
    remove_column :home_bars, :country_id
    remove_column :home_bars, :state_id
    remove_column :home_bars, :city_id
  end
end