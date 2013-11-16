# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Creating Status
if Status.all.size == 0
  Status.create([
                    {:name => "Ativo"},
                    {:name => "Inativo"},
                    {:name => "Pendente"}
                ], :without_protection => true)
end

#Creating Admin User
if AdminUser.all.size == 0
  AdminUser.create([
                       {:email => "admin@example.com", :password => "password"}
                   ], :without_protection => true)
end

if Rails.env.development?

  #Creating Categories example
  if Category.all.size == 0
    Category.create([
                      {:active => true, :name => "Bares", :description => "Todos os Bares", :main_image => File.open('public/categories/category1.jpg') },
                      {:active => false, :name => "Restaurantes", :description => "Todos os Restaurantes", :main_image => File.open('public/categories/category2.jpg') }
                  ], :without_protection => true)
  end

  #Creating Principal example
  if Principal.all.size == 0
    Principal.create([
                         {:title => "Principal titulo", :description => "Descricao principal", :main_image => File.open('public/principal/logo.jpg'), :gallery_image => File.open('public/principal/gallery.jpg'), :events_image => File.open('public/principal/events.jpg'), :contact_image => File.open('public/principal/contact.jpg'), :follow_fb_image => File.open('public/principal/follow_fb.jpg'), :follow_tw_image => File.open('public/principal/follow_tw.jpg') }
                     ], :without_protection => true)
  end

  #Creating Home Bars examples
  if HomeBar.all.size == 0
    HomeBar.create([
                       #Ativos
                       #Completo
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 1", :description => "descricao bar 1", :main_image => File.open('public/home_bars/bar1.JPG'), :phone_number => "telefone bar 1", :cellphone_number => "cel bar 1", :zip => "cep bar 1", :country_bar => "país bar 1", :state => "estado bar 1", :city => "cidade bar 1", :address => "logradouro bar 1", :number => "123", :neighborhood => "bairro bar 1", :complement => "complemento bar 1" },
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 8", :description => "descricao bar 8", :main_image => File.open('public/home_bars/bar8.JPG'), :phone_number => "telefone bar 8", :cellphone_number => "cel bar 8", :zip => "cep bar 8", :country_bar => "país bar 8", :state => "estado bar 8", :city => "cidade bar 8", :address => "logradouro bar 8", :number => "823", :neighborhood => "bairro bar 8", :complement => "complemento bar 8" },
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 11", :description => "descricao bar 11", :main_image => File.open('public/home_bars/bar11.jpg'), :phone_number => "telefone bar 11", :cellphone_number => "cel bar 11", :zip => "cep bar 11", :country_bar => "país bar 11", :state => "estado bar 11", :city => "cidade bar 11", :address => "logradouro bar 11", :number => "1123", :neighborhood => "bairro bar 11", :complement => "complemento bar 11" },

                       #Sem descrição, cep, telefone e complemento
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 2", :main_image => File.open('public/home_bars/bar2.jpg'), :country_bar => "país bar 2", :state => "estado bar 2", :city => "cidade bar 2", :address => "logradouro bar 2", :number => "233", :neighborhood => "bairro bar 2" },
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 5", :main_image => File.open('public/home_bars/bar5.jpg'), :country_bar => "país bar 5", :state => "estado bar 5", :city => "cidade bar 5", :address => "logradouro bar 5", :number => "523", :neighborhood => "bairro bar 5" },

                       #0 no numero do logradouro
                       #Completo
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 3", :description => "descricao bar 3", :main_image => File.open('public/home_bars/bar3.jpg'), :phone_number => "telefone bar 3", :cellphone_number => "cel bar 3", :zip => "cep bar 3", :country_bar => "país bar 3", :state => "estado bar 3", :city => "cidade bar 3", :address => "logradouro bar 3", :number => "0", :neighborhood => "bairro bar 3", :complement => "complemento bar 3"  },
                       #Somente campos obrigatórios preenchidos
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 6", :main_image => File.open('public/home_bars/bar6.jpeg'), :country_bar => "país bar 6", :state => "estado bar 6", :city => "cidade bar 6", :address => "logradouro bar 6", :number => "0", :neighborhood => "bairro bar 6" },

                       #Apenas 1 telefone cadastrado
                       #Completo
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 4", :description => "descricao bar 4", :main_image => File.open('public/home_bars/bar4.jpg'), :phone_number => "telefone bar 4", :zip => "cep bar 4", :country_bar => "país bar 4", :state => "estado bar 4", :city => "cidade bar 4", :address => "logradouro bar 4", :number => "423", :neighborhood => "bairro bar 4", :complement => "complemento bar 4" },
                       #Somente campos obrigatórios preenchidos
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 7", :main_image => File.open('public/home_bars/bar7.jpg'), :phone_number => "telefone bar 7", :country_bar => "país bar 7", :state => "estado bar 7", :city => "cidade bar 7", :address => "logradouro bar 7", :number => "723", :neighborhood => "bairro bar 7" },

                       #Inativo - Completo
                       {:status_id => 2, :category_id => 1, :name => "Nome bar 9", :description => "descricao bar 9", :main_image => File.open('public/home_bars/bar9.jpg'), :phone_number => "telefone bar 9", :cellphone_number => "cel bar 9", :zip => "cep bar 9", :country_bar => "país bar 9", :state => "estado bar 9", :city => "cidade bar 9", :address => "logradouro bar 9", :number => "923", :neighborhood => "bairro bar 9", :complement => "complemento bar 9" },

                       #Pendente - Completo
                       {:status_id => 3, :category_id => 1, :name => "Nome bar 10", :description => "descricao bar 10", :main_image => File.open('public/home_bars/bar10.jpg'), :phone_number => "telefone bar 10", :cellphone_number => "cel bar 10", :zip => "cep bar 10", :country_bar => "país bar 10", :state => "estado bar 10", :city => "cidade bar 10", :address => "logradouro bar 10", :number => "1023", :neighborhood => "bairro bar 10", :complement => "complemento bar 10" }

                   ], :without_protection => true)
  end

end