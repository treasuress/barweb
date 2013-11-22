#encoding: UTF-8

def prepare_session_tests
  @admin_user = AdminUser.new new_admin_user_hash
  load "#{Rails.root}/db/seeds.rb"
  Capybara.reset_sessions!
end

def sign_in_admin_with_success
  @admin_user.save
  sign_in_with_success
end

def sign_in_admin_with_failure
  sign_in_with_failure
end

def sign_out_admin_with_success
  sign_out_with_success
end

private
def sign_in_with_success
  prepare_to_sign_in
  sign_in
  page.should_not have_content("admin_user_email")
  page.should_not have_content("admin_user_password")
  page.should_not have_content("Entrar")
  page.should have_content("Sair")
end

def prepare_to_sign_in
  visit admin_user_session_path
end

def sign_in
  fill_in "admin_user_email", :with => @admin_user.email
  fill_in "admin_user_password", :with => @admin_user.password

  click_button "Entrar"
end

def sign_in_failure
  fill_in "admin_user_email", :with => @admin_user.email
  fill_in "admin_user_password", :with => ""

  click_button "Entrar"
end

def sign_in_with_failure
  prepare_to_sign_in
  sign_in_failure
  page.should have_content("Senha ou e-mail inválidos.")
  sign_in_validator
end

def sign_in_validator
  page.should have_button("Entrar")
  page.should have_link("Esqueceu sua senha?")
  page.should_not have_content("Sair")
end

def sign_out_with_success
  click_link "Sair"
  click_button "Entrar"
  sign_in_validator
end