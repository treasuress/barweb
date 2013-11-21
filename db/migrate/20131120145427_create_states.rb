class CreateStates < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :iso, :null => false
      t.string :name, :null => false

      t.references :country

      t.timestamps
    end
  end
  def down
    drop_table :states
  end
end