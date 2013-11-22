#encoding: UTF-8

def prepare_home_bar_tests
  @admin_user.save
  visit admin_home_bars_path
end

def create_home_bar_with_success
  create_home_bar
end

def fail_at_create_home_bar
  fail_at_create_new_home_bar
end

private
def create_home_bar
  prepare_to_create_home_bar
  fill_in_home_bar
  show_home_bar_details_validator
end

def prepare_to_create_home_bar
  click_link "Novo(a) Estabelecimento"
end

def fill_in_home_bar
  fill_in "home_bar_name", :with => "Flag"
  fill_in "home_bar_description", :with => "descrição flag"
  attach_file("home_bar_logo_bar_image", IMAGE_EXAMPLE)
  fill_in "home_bar_phone_number", :with => "1234-1234"
  fill_in "home_bar_cellphone_number", :with => "9173-2592"
  fill_in "home_bar_zip", :with => "38.400-000"
  fill_in "home_bar_address", :with => "Rua Barao de Camargos"
  fill_in "home_bar_number", :with => "193"
  fill_in "home_bar_neighborhood", :with => "bairro flag"
  fill_in "home_bar_complement", :with => "complemento flag"
  click_button "Criar Estabelecimento"
end

def fail_at_create_new_home_bar
  prepare_to_create_home_bar
  click_button "Criar Estabelecimento"
  page.should have_content("não pode ficar em branco")
end

def show_home_bar_details_validator
  page.should_not have_button("Criar Estabelecimento")
  page.should have_content(I18n.t("activerecord.models.home_bar"))
  page.should have_content(I18n.t("activerecord.attributes.home_bar.id"))
  page.should have_content("STATUS")
  page.should have_content("CATEGORIA")
  page.should have_content("Flag")
  page.should have_content("descrição flag")
  page.should have_content("1234-1234")
  page.should have_content("9173-2592")
  page.should have_content("38.400-000")
  page.should have_content("Rua Barao de Camargos")
  page.should have_content("193")
  page.should have_content("bairro flag")
  page.should have_content("complemento flag")
  page.should have_content("CIDADE")
  page.should have_content("BAIRRO")
  page.should have_content("PAÍS")
end