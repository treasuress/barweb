class CreateHomeBars < ActiveRecord::Migration
  def up
    create_table :home_bars do |t|
      t.string :name, :null => false
      t.string :description, :limit => 227

      t.string :phone_number
      t.string :cellphone_number

      t.string :logo_bar_image_file_name
      t.string :logo_bar_image_content_type
      t.integer :logo_bar_image_file_size
      t.datetime :logo_bar_image_updated_at

      #Endereço
      t.string :zip
      t.string :address, :null => false
      t.integer :number, :null => false
      t.string :complement
      t.string :neighborhood, :null => false

      t.references :category

      t.timestamps
    end
  end
  def down
    drop_table :home_bars
  end
end