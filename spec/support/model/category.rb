def new_category_hash
  puts IMAGE_EXAMPLE
  {
      :name => "Bares ",
      :description => "Todos os Bares",
      :main_image => File.new(IMAGE_EXAMPLE)
  }
end