ActiveAdmin.register AdminUser do
  config.comments = false

  filter :email

  index do
    column :id
    column :email
    column :created_at
    default_actions                   
  end

  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs t("activerecord.models.admin_user") do
      if f.object.new_record?
        f.input :email
        f.input :password
        f.input :password_confirmation
      else
        f.input :email
      end
    end
    f.actions
  end

end