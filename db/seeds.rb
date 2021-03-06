# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Rails.env.development?
  Country.delete_all
  State.delete_all
  City.delete_all
end

require_relative "countries.rb"
require_relative "categories.rb"

create_countries

#Creating Status
if Status.all.size == 0
  Status.create([
                    {:name => "Ativo"},
                    {:name => "Inativo"},
                    {:name => "Pendente"}
                ], :without_protection => true)
end

if Rails.env.production?
  create_categories
end

if Rails.env.development?
  Category.delete_all
  Principal.delete_all
  HomeBar.delete_all

  #Creating Categories example
  if Category.all.size == 0
    Category.create([
                      {:active => true, :name => "Bares",        :description => "Todos os Bares",        :category_image => File.open('public/categories/category1.jpg') },

                      {:active => true, :name => "Pizzarias",    :description => "Todos as Pizzarias",    :category_image => File.open('public/categories/category2.jpg') },

                      {:active => true, :name => "Restaurantes", :description => "Todos os Restaurantes", :category_image => File.open('public/categories/category3.jpg') },

                      {:active => true, :name => "Categoria sem img" }



                  ], :without_protection => true)
  end

  #Creating Principal example
  if Principal.all.size == 0
    Principal.create([
                         {:active => true, :title => "Principal titulo",
                          :description => "Veja todos os bares cadastrados no mapa acima! Encontre novos bares! Dê sua opinião sobre os bares que você frequênta!",
                          :logo_image => File.open('public/principal/logo.jpg'),
                          :gallery_image => File.open('public/principal/gallery.jpg'),
                          :events_image => File.open('public/principal/events.jpg'),
                          :contact_image => File.open('public/principal/contact.jpg'),
                          :follow_fb_image => File.open('public/principal/follow_fb.jpg'),
                          :follow_tw_image => File.open('public/principal/follow_tw.jpg') }
                     ], :without_protection => true)
  end

  #Creating Home Bars examples
  if HomeBar.all.size == 0
    HomeBar.create([
                       #Ativos
                       #Completo - bar 1
                       {:status_id => 1, :category_id => 1, :name => "Beco da Canela",
                        :description => "O Beco da Canela é um local onde você pode passar bons momentos, em um local seguro, clima tranquilo e de pessoas de bom gosto.
Desfrute de um cardápio de bebidas e comida variado de qualidade, além de sempre ouvir os melhores",
                        :logo_bar_image => File.open("public/home_bars/bar1.jpg"),
                        :phone_number => "(034) 9173-2592", :cellphone_number => "(034) 8806-7612",
                        :zip => "38.408-100", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "Avenida João Naves de Ávila", :number => "123",
                        :neighborhood => "Saraiva", :complement => "complemento beco da canela" },

                       #Completo - bar 2
                       {:status_id => 1, :category_id => 2, :name => "Flag",
                        :description => "O Flag é um bar mutante.
As comidas, bebidas, músicas e decoração mudam de acordo com a bandeira içada na nossa fachada.",
                        :logo_bar_image => File.open('public/home_bars/bar8.jpg'),
                        :phone_number => "(034) 3234-8809", :cellphone_number => "",
                        :zip => "38.400-160", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "Rua Barao de Camargos", :number => "193",
                        :neighborhood => "Centro", :complement => "complemento bar flag" },

                       #Sem imagem
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 11",
                        :description => "descricao bar 11",
                        :phone_number => "", :cellphone_number => "",
                        :zip => "", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "logradouro bar 11", :number => "1123",
                        :neighborhood => "bairro bar 11", :complement => "complemento bar 11" },

                       #todo seb now - apostrofe de nome tá atrapalhando na busca City.find_by_home_bar
                       #todo seb now - mudar status para ativo qndo resolver prob da apostrofe
                       #Sem descrição, cep, telefone e complemento - bar 1
                       {:status_id => 2, :category_id => 1, :name => "Rock'n Beer",
                       :logo_bar_image => File.open('public/home_bars/bar2.png'),
                       :country_id => 1, :state_id => 1, :city_id => 2,
                       :address => "Av. Floriano Peixoto", :number => "18",
                       :neighborhood => "Centro" },

                       #Sem descrição, cep, telefone e complemento - bar 2
                       {:status_id => 1, :category_id => 2, :name => "Othello Bar e Restaurante",
                        :logo_bar_image => File.open('public/home_bars/bar5.jpg'),
                        :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "Avenida Segismundo Pereira", :number => "169",
                        :neighborhood => "Santa Monica" },

                       #0 no numero do logradouro
                       #Completo
                       {:status_id => 1, :category_id => 1, :name => "Thália",
                        :description => "descricao thalia",
                        :logo_bar_image => File.open('public/home_bars/bar3.jpg'),
                        :phone_number => "(034) 3210-8135", :cellphone_number => "",
                        :zip => "", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "Avenida Rondon Pacheco", :number => "0",
                        :neighborhood => "Cazeca", :complement => "complemento thalia" },

                       #Somente campos obrigatórios preenchidos
                       {:status_id => 1, :category_id => 1, :name => "Mimi Quiosque",
                        :logo_bar_image => File.open('public/home_bars/bar6.png'),
                        :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "Avenida João Naves de Ávila", :number => "0",
                        :neighborhood => "Santa Monica" },

                       #Apenas 1 telefone cadastrado
                       #Completo
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 4",
                        :description => "descricao bar 4",
                        :logo_bar_image => File.open('public/home_bars/bar4.jpg'),
                        :phone_number => "",
                        :zip => "", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "logradouro bar 4", :number => "423",
                        :neighborhood => "bairro bar 4", :complement => "complemento bar 4" },

                       #Somente campos obrigatórios preenchidos
                       {:status_id => 1, :category_id => 1, :name => "Nome bar 7",
                        :logo_bar_image => File.open('public/home_bars/bar7.jpg'),
                        :phone_number => "",
                        :country_id => 1, :state_id => 1, :city_id => 2,
                        :address => "logradouro bar 7", :number => "723",
                        :neighborhood => "bairro bar 7" },

                       #Inativo - Completo
                       {:status_id => 2, :category_id => 1, :name => "Nome bar inativo 9",
                        :description => "descricao bar 9",
                        :logo_bar_image => File.open('public/home_bars/bar9.jpg'),
                        :phone_number => "", :cellphone_number => "",
                        :zip => "", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "logradouro bar 9", :number => "923",
                        :neighborhood => "bairro bar 9", :complement => "complemento bar 9" },

                       #Pendente - Completo
                       {:status_id => 3, :category_id => 1, :name => "Nome bar pendente 10",
                        :description => "descricao bar 10",
                        :logo_bar_image => File.open('public/home_bars/bar10.jpg'),
                        :phone_number => "", :cellphone_number => "",
                        :zip => "", :country_id => 1, :state_id => 1, :city_id => 1,
                        :address => "logradouro bar 10", :number => "1023",
                        :neighborhood => "bairro bar 10", :complement => "complemento bar 10" }

                   ], :without_protection => true)
  end

end

if Rails.env.test?
    if Category.all.size == 0
      Category.create([
                          {:active => true, :name => "Restaurantes", :description => "Todos os Restaurantes",
                           :category_image => File.open('public/categories/category2.jpg') }
                      ], :without_protection => true)
    end
end