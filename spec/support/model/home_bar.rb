def new_home_bar_hash
  puts IMAGE_EXAMPLE
  {
      :status_id => 1,
      :category_id => 1,
      :name => "Bares",
      :description => "Todos os Bares",
      :logo_bar_image => File.new(IMAGE_EXAMPLE),
      :phone_number => "telefone bar 1",
      :cellphone_number => "cel bar 1",
      :zip => "cep bar 1",
      :country_bar => "pais bar 1",
      :state => "estado bar 1",
      :city => "cidade bar 1",
      :address => "endereço bar 1",
      :number => 123,
      :neighborhood => "bairro bar 1",
      :complement => "complemento bar 1"
  }
end