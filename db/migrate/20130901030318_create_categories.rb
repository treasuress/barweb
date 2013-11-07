class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :active

      t.string :main_image_file_name
      t.string :main_image_content_type
      t.integer :main_image_file_size
      t.datetime :main_image_updated_at

      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end