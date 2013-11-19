class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :active

      t.string :category_image_file_name
      t.string :category_image_content_type
      t.integer :category_image_file_size
      t.datetime :category_image_updated_at

      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end