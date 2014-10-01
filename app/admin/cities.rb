ActiveAdmin.register City do
  config.comments = false

  filter :state
  filter :name

  index do
    column :id
    column :state
    column :name
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :state
      row :name
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.models.city"), :multipart => true do
      f.input :state
      f.input :name
    f.actions
    end
  end

end
