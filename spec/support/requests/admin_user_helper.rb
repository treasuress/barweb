#encoding: UTF-8

def prepare_admin_user_tests
  @admin_user.save
  visit admin_admin_users_path
end

def create_admin_user_with_success
  create_admin_user
end

def fail_at_create_admin_user
  fail_at_create_new_admin_user
end

def show_index_admin_users_with_success
  show_index_admin_users
end

def edit_admin_user_with_success
  edit_admin_user
end

def fail_at_edit_admin_user
  fail_at_edit_the_admin_user
end

def delete_admin_user_with_success
  delete_admin_user
end

private
def create_admin_user
  prepare_to_create_admin_user
  fill_in_admin_user
  show_admin_user_details_validator
end

def show_index_admin_users
  visit admin_admin_users_path
  index_validator
end

def edit_admin_user
  prepare_to_edit
  edit_admin_user_validator
  change_fields_admin_user
  show_admin_user_change_details_validator
end

def delete_admin_user
  prepare_to_delete
  delete_validator
  page.should have_content("Você precisa registrar-se ou fazer login para continuar.")
end

def prepare_to_create_admin_user
  click_link "Novo(a) Administrador"
end

def prepare_to_edit
  click_link "Editar"
end

def prepare_to_delete
  click_link "Remover"
  page.driver.browser.switch_to.alert.accept
end

def fill_in_admin_user
  fill_in "admin_user_email", :with => "usuario@email.com.br"
  fill_in "admin_user_password", :with => "12345678"
  fill_in "admin_user_password_confirmation", :with => "12345678"

  click_button "Criar Administrador"
end

def fail_at_create_new_admin_user
  prepare_to_create_admin_user
  click_button "Criar Administrador"
  page.should have_content("não pode ficar em branco")
end

def edit_admin_user_validator
  page.should have_content(I18n.t("activerecord.models.admin_user"))
  page.should have_content(I18n.t("activerecord.attributes.admin_user.email"))
end

def fail_at_edit_the_admin_user
  prepare_to_edit
  edit_admin_user_validator
  change_fields_admin_user_to_blank
  click_button "Atualizar Administrador"
  edit_admin_user_validator
  page.should have_content("não pode ficar em branco")
end

def change_fields_admin_user
  fill_in "admin_user_email", :with => "usuario2@email.com.br"

  click_button "Atualizar Administrador"
end

def change_fields_admin_user_to_blank
  fill_in "admin_user_email", :with => ""

  click_button "Atualizar Administrador"
end

def delete_validator
  page.should_not have_link("Visualizar")
  page.should_not have_link("Editar")
  page.should_not have_link("Remover")
end

def show_admin_user_details_validator
  page.should_not have_button("Criar Administrador")
  page.should have_content(I18n.t("activerecord.models.admin_user"))
  page.should have_content(I18n.t("activerecord.attributes.admin_user.id"))
  page.should have_content("usuario@email.com.br")
  page.should have_content(I18n.t("activerecord.attributes.admin_user.created_at"))
  page.should have_content(I18n.t("activerecord.attributes.admin_user.updated_at"))
end

def index_validator
  page.should have_link("Visualizar")
  page.should have_link("Editar")
  page.should have_link("Remover")
end

def show_admin_user_change_details_validator
  page.should_not have_button("Criar Administrador")
  page.should have_content(I18n.t("activerecord.models.admin_user"))
  page.should have_content(I18n.t("activerecord.attributes.admin_user.id"))
  page.should have_content("usuario2@email.com.br")
  page.should have_content(I18n.t("activerecord.attributes.admin_user.created_at"))
  page.should have_content(I18n.t("activerecord.attributes.admin_user.updated_at"))
end