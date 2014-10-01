ActiveAdmin.register HomeBar do
  config.comments = false

  #todo we - tirar esse 'açoes em lote' da pagina

  scope :active, :default => true
  scope :inactive
  scope :pending

  filter :name
  filter :category

  index do
    column :id
    column :category
    column :name
    column :logo_bar_image do |record|
      image_tag(record.logo_bar_image.url(:thumb))
    end

    #todo seb now - colokr em negrito o status atual ou tirar já q a pessoa seleciona em qual status ver
    column :status

    #colokr partial aqui para escolher estatus do bar
    column :status do |record|
      if record.bar_pending? || record.bar_inactive?
        #todo now - colokr pra alterar status
        #se n conseguir link, talvez consiga entrar na pagina d edicao, mudar o status e confirmar -
        #se tiver algum dado obrigatorio n preenchido, dah msg d erro informando e falar q n foi possivel fazer a alteração

        link_to I18n.t('activerecord.attributes.home_bar.activate')


        #link_to I18n.t('active_admin.active'), :method => :put, :data => { :confirm => "Deseja alterar o status deste estabelecimento?" }, :class => "member_link view_link"
        #:status_id => 1, :confirm => "Deseja ativar este estabelecimento?" }, :class => "member_link view_link"
        #link_to (record.active? ? I18n.t('active_admin.active') : I18n.t('active_admin.inactive')), change_status_admin_principal_path(record), :method => :put, :data => { :confirm => "Deseja alterar o status deste estabelecimento?" }, :class => "member_link view_link"
        #link_to (record.status_id = 2 ? I18n.t('active_admin.active') : I18n.t('active_admin.inactive')), change_status_admin_status_path(record), :method => :put, :data => { :confirm => "Deseja alterar o status deste estabelecimento?" }, :class => "member_link view_link"

      else if record.bar_active?
        link_to I18n.t('activerecord.attributes.home_bar.deactivate')
           end
      end
    end

    column :status do |record|
      if record.bar_inactive? || record.bar_active?
        link_to I18n.t('activerecord.attributes.home_bar.keep_pending')

      else if record.bar_pending?
        link_to I18n.t('activerecord.attributes.home_bar.deactivate')
           end
      end
    end

    default_actions
  end

  action_item :only => :show do
    link_to "Novo Estabelecimento", 'new'
  end

  show do
    attributes_table do
      row :id
      row :status
      row :category
      row :name
      row :description

      row :logo_bar_image do |record|
        image_tag(record.logo_bar_image.url(:thumb))
      end
      rows :phone_number, :cellphone_number

      rows :address, :number, :complement, :zip
      rows :neighborhood, :city, :state, :country
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.attributes.home_bar.general_information"), :multipart => true do
      f.input :status, :include_blank => false
      f.input :category, :include_blank => false, :collection => Category.active
      f.input :name
      f.input :description, :as => :text, :input_html => { :maxlength => 227, :style => "resize:none" }
      f.input :logo_bar_image
      #todo now - devia aparecer mascara qndo a pessoa digita
      f.input :phone_number, :as => :phone, :placeholder => "(034) 3232-3232" #todo futuro , :collection => ['Sugestão', 'Crítica', 'Elogio', 'Outro'] - escolher tipo de telefone q será add

      f.input :cellphone_number, :as => :phone, :placeholder => "(034) 99898-9898"
    end

    f.inputs I18n.t("activerecord.attributes.home_bar.all_address"), :multipart => true do
      #todo now - devia aparecer mascara qndo a pessoa digita
      f.input :zip, :placeholder => "38400-000"

      f.input :country, :include_blank => false
      f.input :state, :include_blank => false
      f.input :city, :include_blank => false
      f.input :address
      f.input :number
      f.input :neighborhood
      f.input :complement
    end
    f.actions
  end

end