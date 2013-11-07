ActiveAdmin.register Category do
  config.comments = false

  filter :name

  index do
    column :name
    column :main_image do |record|
      image_tag(record.main_image.url(:thumb))
    end
    column :active do |record|
      record.active == true ? "Ativo" : "Inativo"
    end
    default_actions
  end

  show do |category|
    attributes_table do
      row :name
      row :description do |record|
        record.description.html_safe
      end
      row :active do |record|
        record.active == true ? "Ativo" : "Inativo"
      end

      if !category.main_image_file_size.nil?
        row :main_image do
          image_tag(category.main_image.url(:thumb))
        end
      end
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.attributes.category.general_category"), :multipart => true do

      #todo vir marcado como ativo por default - fiz isso em algum proj
      # qndo eh new, vem checado, caso contrario, pega do banco
      f.input :active
      f.input :name
      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :main_image
    end
    f.actions
  end
  
end