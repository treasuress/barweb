def new_principal_hash
  puts IMAGE_EXAMPLE
  {
      :title => "Titulo Principal",
      :description => "Descrição principal",
      :logo_image => File.new(IMAGE_EXAMPLE),
      :gallery_image => File.new(IMAGE_EXAMPLE),
      :events_image => File.new(IMAGE_EXAMPLE),
      :contact_image => File.new(IMAGE_EXAMPLE),
      :follow_fb_image => File.new(IMAGE_EXAMPLE),
      :follow_tw_image => File.new(IMAGE_EXAMPLE)
  }
end