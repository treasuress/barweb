Barweb::Application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :admin_users, ActiveAdmin::Devise.config


  #PÁGINA PRINCIPAL GERAL

  get "/" => "principal#index", :as => :principal

  get "/contact" => "principal#contact", :as => :principal_contact

  get "/gallery" => "principal#gallery", :as => :principal_gallery

  get "/events" => "principal#events", :as => :principal_events


  #PÁGINA PRINCIPAL POR CIDADE

  #todo: pegar nome da cidade dinamicament
  get "/uberlandia" => "home_uberlandia#index", :as => :home_uberlandia

  #PÁGINA QUE MOSTRA TODOS OS BARES CADASTRADOS EM DETERMINADA CIDADE

  get "/uberlandia/all" => "home_bar#all", :as => :all_home_bars


  #PÁGINA HOME PARA TODOS OS BARES

  get "/uberlandia/:name" => "home_bar#index", :as => :home_bar


  #PÁGINAS PAGAS - SÓ SÃO MOSTRADAS PARA ESTABELECIMENTOS QUE PAGAREM


  #OBS: SE SÓ A GENTE FOR MEXER NO ADMIN, NÃO PRECISA DE SUPER ADMIN PARA SEPARAR ISSO, CASO CONTRÁRIO, PRECISA!

  # TODO: PEGAR TXT DINAMICAMENTE PRA PODER CRIAR SÓ UM ARQUIVO
  # DEVE DAR PRA USAR O MESMO PELO MENOS ENTRE AS HOMES
  get "/uberlandia/:name/contact" => "home_bar#contact", :as => :homebar_contac

  get "/uberlandia/:name/gallery" => "home_bar#gallery", :as => :homebar_gallery

  get "/uberlandia/:name/events" => "home_bar#events", :as => :homebar_events


  #todo: fazer rel q gera lista de urls dos bares

  #todo: fazer parte gerencial ?!

  root :to =>  "principal#index"

  ActiveAdmin.routes(self)

end