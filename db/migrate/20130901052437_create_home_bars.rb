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

      #todo futuro - isso deve ficar em uma página principal pro bar ou pelo menos, só colokr qndo for usar
      #Imagens personalizadas de galeria de fotos, eventos e contato
      #t.string :gallery_image_file_name
      #t.string :gallery_image_content_type
      #t.integer :gallery_image_file_size
      #t.datetime :gallery_image_updated_at
      #
      #t.string :events_image_file_name
      #t.string :events_image_content_type
      #t.integer :events_image_file_size
      #t.datetime :events_image_updated_at
      #
      #t.string :contact_image_file_name
      #t.string :contact_image_content_type
      #t.integer :contact_image_file_size
      #t.datetime :contact_image_updated_at
      #
      #t.string :follow_fb_image_file_name
      #t.string :follow_fb_image_content_type
      #t.integer :follow_fb_image_file_size
      #t.datetime :follow_fb_image_updated_at
      #
      #t.string :follow_tw_image_file_name
      #t.string :follow_tw_image_content_type
      #t.integer :follow_tw_image_file_size
      #t.datetime :follow_tw_image_updated_at

      t.references :category

      t.timestamps
    end
  end
  def down
    drop_table :home_bars
  end
end