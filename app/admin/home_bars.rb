ActiveAdmin.register HomeBar do
  config.comments = false

  filter :name

  index do
    column :id
    column :name
    column :main_image do |record|
      image_tag(record.main_image.url(:thumb))
    end
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description

      row :main_image do |record|
        image_tag(record.main_image.url(:thumb))
      end
      rows :phone_number, :cellphone_number   #todo: cellphone? - colocar pra escolher tipo de telefone - criar funcao q cria no banco os tipos d telefones, aí chamar no combo esses tipos

      rows :address, :number, :complement, :zip
      rows :neighborhood, :city, :state, :country_bar
    end
  end

  #todo: colocar cadastro de email pra usar em contato - caso tenha pagado, senao n precisa
  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs I18n.t("activerecord.attributes.home_bar.general_information"), :multipart => true do
      f.input :name

      #todo: colocar campo de text, pra colokr html (com formatacoes, etc)
      #todo: limitar tamanho do campo
      f.input :description, :as => :text, :input_html => {:rows => 4}

      f.input :main_image

      #TODO: COLOCAR ALGUMA MASCARA PRA N TER COMO ENVIAR ERRADO (HTML5)
      #todo: ou colocar ddd separado, ou colokr mascara bonitinha: 034 1234 5678 - 034 12345 6789
      #todo colokr tdos os campos d tel com o 9o digito. se a pessoa n preencher, add um 0 no comeco
      f.input :phone_number, :as => :phone #, :input_html => {:patter => "\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4}"}
      f.input :cellphone_number, :as => :phone
    end

    f.inputs I18n.t("activerecord.attributes.home_bar.address"), :multipart => true do
      f.input :zip
      f.input :country_bar
      f.input :state
      f.input :city
      f.input :address
      f.input :number
      f.input :neighborhood
      f.input :complement
    end
    f.actions
  end
end