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

    #todo we - colokr akih forma de mudar o status dos bares
    column :status

    default_actions
  end

  #todo we - colokr botao para cadastrar novo bar no show
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
      rows :phone_number, :cellphone_number   #todo futuro - cellphone? - colocar pra escolher tipo de telefone - criar funcao q cria no banco os tipos d telefones, aí chamar no combo esses tipos

      rows :address, :number, :complement, :zip
      rows :neighborhood, :city, :state, :country
    end
  end

  #todo futuro - colocar cadastro de email pra usar em contato - caso tenha pagado, senao n precisa
  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.attributes.home_bar.general_information"), :multipart => true do
      f.input :status, :include_blank => false
      f.input :category, :include_blank => false, :collection => Category.active
      f.input :name

      #todo we - fazer ficar 20% à direita - n pega o style nem classe separada
      #todo we - trocar pro ckeditor dps d novo pra ver se funciona (n limita qntidad d caracteres)
      f.input :description, :as => :text, :input_html => { :maxlength => 227, :style => "resize:none" }
      #f.input :description, :as => :ckeditor, :input_html => {:width => "79%", :style => 'margin-left: 20%;', :maxlength => 380}
      #f.input :description, :as => :ckeditor, :input_html => { class: 'home_bar_description'}'}
      #f.input :description, :as => :ckeditor, :input_html => {:width => "79%", :style => 'margin-left: 20%;'}
      #f.input :description, :as => :ckeditor, :input_html => { class: 'home_bar_description'}
      #f.input :description, :as => :ckeditor, :input_html => {:width => "78%", :"margin-left" => "20%" }
      #f.input :description, :as => :ckeditor, :input_html => {:width => "78%", "margin-left" => "20%" }


      f.input :logo_bar_image

      f.input :phone_number, :as => :phone, :placeholder => "(034) 3232-3232"
      f.input :cellphone_number, :as => :phone, :placeholder => "(034) 99898-9898"
    end

    f.inputs I18n.t("activerecord.attributes.home_bar.address"), :multipart => true do
      f.input :zip, :placeholder => "38400-000"
      #todo we - colokr campos maiores pq tao mt feios
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