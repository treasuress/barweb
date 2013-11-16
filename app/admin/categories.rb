ActiveAdmin.register Category do
  config.comments = false

  filter :name

  index do
    column :id
    column :name
    column :main_image do |record|
      image_tag(record.main_image.url(:thumb))
    end
    column :active do |record|
      record.active == true ? 'Ativo' : 'Inativo'
    end
    default_actions
  end

  show do |category|
    attributes_table do
      row :id
      row :name
      row :description do |record|
        record.description.html_safe
      end
      row :active do |record|
        record.active == true ? 'Ativo' : 'Inativo'
      end

      if !category.main_image_file_size.nil?
        row :main_image do
          image_tag(category.main_image.url(:thumb))
        end
      end
    end
  end

  form :html => {:enctype => 'multipart/form-data'} do |f|
    f.inputs I18n.t('activerecord.models.category'), :multipart => true do
      if f.object.new_record?
        f.input :active, :input_html => {:checked => 'true'}
      else
        f.input :active
      end
      f.input :name
      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :main_image
    end
    f.actions
  end
  
end