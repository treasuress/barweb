class CreateHomeBars < ActiveRecord::Migration
  def up
    create_table :home_bars do |t|
      t.string :name, :null => false
      t.string :description

      t.string :phone_number
      t.string :cellphone_number

      t.string :main_image_file_name
      t.string :main_image_content_type
      t.integer :main_image_file_size
      t.datetime :main_image_updated_at

      #Endereço
      t.string :zip
      t.string :country_bar, :null => false
      t.string :address, :null => false
      t.integer :number, :null => false
      t.string :complement, :null => false
      t.string :neighborhood, :null => false
      t.string :state, :null => false
      t.string :city, :null => false

      #Imagens personalizadas de galeria de fotos, eventos e contato
      # E ELA SÓ É MUDADA, CASO A PESSOA CADASTRE UMA NOVA IMG
      #TODO: COLOCAR UMA IMG PADRÃO NO CSS OU ALGUM OUTRO LUGAR,
      t.string :gallery_image_file_name
      t.string :gallery_image_content_type
      t.integer :gallery_image_file_size
      t.datetime :gallery_image_updated_at

      t.string :events_image_file_name
      t.string :events_image_content_type
      t.integer :events_image_file_size
      t.datetime :events_image_updated_at

      t.string :contact_image_file_name
      t.string :contact_image_content_type
      t.integer :contact_image_file_size
      t.datetime :contact_image_updated_at

      t.string :follow_fb_image_file_name
      t.string :follow_fb_image_content_type
      t.integer :follow_fb_image_file_size
      t.datetime :follow_fb_image_updated_at

      t.timestamps
    end
  end
  def down
    drop_table :home_bars
  end
end