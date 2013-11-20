class CreateStates < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :iso
      t.string :name

      t.references :country

      t.timestamps
    end
  end
  def down
    drop_table :states
  end
end