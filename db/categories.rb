def create_categories
  begin

    if Category.all.size == 0

      #todo futuro - colokr tdas as categorias
      Category.create([
                          {:active => true, :name => "Bares", :description => "Todos os Bares", :category_image => File.open('public/categories/category1.jpg') }
                      ])
    end

  end
end