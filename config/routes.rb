Barweb::Application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :admin_users, ActiveAdmin::Devise.config


  #PÁGINA PRINCIPAL GERAL

  get "/" => "principal#index", :as => :principal

  get "/contact" => "principal#contact", :as => :principal_contact

  get "/gallery" => "principal#gallery", :as => :principal_gallery

  get "/events" => "principal#events", :as => :principal_events

  get "/terms" => "principal#terms", :as => :terms


  #PÁGINA PRINCIPAL - POR CIDADE

  #todo now futuro - pegar nome da cidade dinamicament
  get "/uberlandia" => "home_uberlandia#index", :as => :home_uberlandia


  #PÁGINA DE TODAS AS CATEGORIAS CADASTRADAS - POR CIDADE
  get "/uberlandia/categories" => "category#index", :as => :all_categories


  #PÁGINA DE TODOS OS BARES CADASTRADOS - POR CIDADE
  get "/uberlandia/category/:name" => "category#show", :as => :category


  #PÁGINA HOME - POR ESTABELECIMENTO

  get "/uberlandia/:name" => "home_bar#index", :as => :home_bar


  #PÁGINAS PAGAS - SÓ SÃO MOSTRADAS PARA ESTABELECIMENTOS QUE PAGAREM


  #OBS: SE SÓ A GENTE FOR MEXER NO ADMIN, NÃO PRECISA DE SUPER ADMIN PARA SEPARAR ISSO, CASO CONTRÁRIO, PRECISA!

  # TODO futuro - PEGAR TXT DINAMICAMENTE PRA PODER CRIAR SÓ UM ARQUIVO
  get "/uberlandia/:name/contact" => "home_bar#contact", :as => :home_bar_contac

  get "/uberlandia/:name/gallery" => "home_bar#gallery", :as => :home_bar_gallery

  get "/uberlandia/:name/events" => "home_bar#events", :as => :home_bar_events


  #todo futuro - fazer rel q gera lista de urls dos bares

  #todo futuro - fazer parte gerencial ?!

  root :to =>  "principal#index"

  ActiveAdmin.routes(self)

end