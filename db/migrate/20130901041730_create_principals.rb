class CreatePrincipals < ActiveRecord::Migration
  def up
    create_table :principals do |t|
      t.string :title
      t.string :description

      t.string :main_image_file_name
      t.string :main_image_content_type
      t.integer :main_image_file_size
      t.datetime :main_image_updated_at

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

      t.string :follow_tw_image_file_name
      t.string :follow_tw_image_content_type
      t.integer :follow_tw_image_file_size
      t.datetime :follow_tw_image_updated_at

      t.timestamps
    end
  end
  def down
    drop_table :principals
  end
end