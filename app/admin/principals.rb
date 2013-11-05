ActiveAdmin.register Principal do
  config.comments = false

  filter :title

  index do
    column :id
    column :title
    column :main_image do |record|
      image_tag(record.main_image.url(:thumb))
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
      rows :title, :description
      row :main_image do |record|
        image_tag(record.main_image.url(:thumb))
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
    f.inputs I18n.t("activerecord.models.home"), :multipart => true do
      f.input :title
      f.input :description
      f.input :main_image
      f.input :gallery_image
      f.input :events_image
      f.input :contact_image
      f.input :follow_fb_image
      f.input :follow_tw_image
    end
    f.actions
  end

end