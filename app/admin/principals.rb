ActiveAdmin.register Principal do
  config.comments = false

  filter :title

  index do
    column :id
    column :title
    column :status do |record|
      link_to (record.active? ? I18n.t('active_admin.active') : I18n.t('active_admin.inactive')), change_status_admin_principal_path(record), :method => :put, :data => { :confirm => "Deseja alterar o status deste estabelecimento?" }, :class => "member_link view_link"
    end
    column :logo_image do |record|
      image_tag(record.logo_image.url(:thumb))
    end
    column :gallery_image do |record|
      image_tag(record.gallery_image.url(:thumb))
    end
    column :events_image do |record|
      image_tag(record.events_image.url(:thumb))
    end
    column :contact_image do |record|
      image_tag(record.contact_image.url(:thumb))
    end
    column :follow_fb_image do |record|
      image_tag(record.follow_fb_image.url(:thumb))
    end
    column :follow_tw_image do |record|
      image_tag(record.follow_tw_image.url(:thumb))
    end
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :active do |record|
        record.active == true ? 'Ativo' : 'Inativo'
      end
      rows :title, :description
      row :logo_image do |record|
        image_tag(record.logo_image.url(:thumb))
      end
      row :gallery_image do |record|
        image_tag(record.gallery_image.url(:thumb))
      end
      row :events_image do |record|
        image_tag(record.events_image.url(:thumb))
      end
      row :contact_image do |record|
        image_tag(record.contact_image.url(:thumb))
      end
      row :follow_fb_image do |record|
        image_tag(record.follow_fb_image.url(:thumb))
      end
      row :follow_tw_image do |record|
        image_tag(record.follow_tw_image.url(:thumb))
      end
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.models.principal"), :multipart => true do
      f.input :active
      f.input :title
      f.input :description, :as => :text, :input_html => { :maxlength => 380 }
      f.input :logo_image
      f.input :gallery_image
      f.input :events_image
      f.input :contact_image
      f.input :follow_fb_image
      f.input :follow_tw_image
    end
    f.actions
  end

  member_action :change_status, :method => :put do
    record = Principal.find(params[:id])
    record.change_status!
    redirect_to admin_principals_path, :notice => I18n.t('activerecord.attributes.principal.activate_message', :name => record.title, :status => record.active_status_name)
  end

end

#todo we - colokr pra pessoa poder visualizar a pagina antes de criar - fancybox