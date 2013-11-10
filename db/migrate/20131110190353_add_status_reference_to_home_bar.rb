class AddStatusReferenceToHomeBar < ActiveRecord::Migration
  def up
    add_column :home_bars, :status_id, :integer
  end
  def down
    remove_column :home_bars, :status_id
  end
end