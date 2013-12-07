Barweb::Application.routes.draw do
  resources :contacts

  #todo now futuro - ver se tiro referencias desse trem
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :admin_users, ActiveAdmin::Devise.config


  #PÁGINA PRINCIPAL GERAL

  get "/" => "principal#index", :as => :principal

  get "/contato" => "contacts#new", :as => :principal_contact

  get "/fotos" => "principal#gallery", :as => :principal_gallery

  get "/eventos" => "principal#events", :as => :principal_events

  get "/termos" => "principal#terms", :as => :terms


  ActiveAdmin.routes(self)


  #PÁGINA PRINCIPAL - POR CIDADE

  get "/:city_name" => "city#index", :as => :home_city


  #PÁGINA DE TODAS AS CATEGORIAS CADASTRADAS - POR CIDADE
  get "/:city_name/categorias" => "category#index", :as => :all_categories


  #PÁGINA DE TODOS OS ESTABELCIMENTOS CADASTRADOS - POR CIDADE E CATEGORIA
  get "/:city_name/categoria/:category_name" => "category#show", :as => :category


  #PÁGINA HOME - POR NOME DE ESTABELECIMENTO

  get "/:city_name/:bar_name" => "home_bar#index", :as => :home_bar


  #PÁGINAS PAGAS - SÓ SÃO MOSTRADAS PARA ESTABELECIMENTOS QUE PAGAREM


  #OBS: SE SÓ A GENTE FOR MEXER NO ADMIN, NÃO PRECISA DE SUPER ADMIN PARA SEPARAR ISSO, CASO CONTRÁRIO, PRECISA!

  # TODO futuro - PEGAR TXT do banco PRA pegar txts dinamicamente e CRIAR SÓ UM ARQUIVO
  get "/:city_name/:bar_name/contato" => "home_bar#contact", :as => :home_bar_contac

  get "/:city_name/:bar_name/fotos" => "home_bar#gallery", :as => :home_bar_gallery

  get "/:city_name/:bar_name/eventos" => "home_bar#events", :as => :home_bar_events


  #todo futuro - fazer rel q gera lista de urls dos bares

  #todo futuro - fazer parte gerencial ?!

  root :to =>  "principal#index"

  #todo now - qndo página n existir, dah erros mt feios, entao ir pra pagina n encontrada em tdas q n existir


end