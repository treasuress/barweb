def new_home_bar_hash
  puts IMAGE_EXAMPLE
  {
      :status_id => 1,
      :category_id => 1,
      :name => "Nome bar 1",
      :description => "Bar 1",
      :logo_bar_image => File.new(IMAGE_EXAMPLE),
      :phone_number => "(034) 3234-8809",
      :cellphone_number => "(034) 3234-8809",
      :zip => "38408-100",
      :country_id => 1,
      :state_id => 1,
      :city_id => 1,
      :address => "endereço bar 1",
      :number => 123,
      :neighborhood => "bairro bar 1",
      :complement => "complemento bar 1"
  }
end