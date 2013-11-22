#encoding: UTF-8

def prepare_principal_tests
  @admin_user.save
  visit admin_principals_path
end

def create_principal_with_success
  create_principal
end

def fail_at_create_principal
  fail_at_create_new_principal
end

private
def create_principal
  prepare_to_create_principal
  fill_in_principal
  show_principal_details_validator
end

def prepare_to_create_principal
  click_link "Novo(a) Página Principal"
end

def fill_in_principal
  fill_in "principal_title", :with => "Princiapl título"
  fill_in "principal_description", :with => "Descrição principal"
  attach_file("principal_logo_image", IMAGE_EXAMPLE)
  attach_file("principal_gallery_image", IMAGE_EXAMPLE)
  attach_file("principal_events_image", IMAGE_EXAMPLE)
  attach_file("principal_contact_image", IMAGE_EXAMPLE)
  attach_file("principal_follow_fb_image", IMAGE_EXAMPLE)
  attach_file("principal_follow_tw_image", IMAGE_EXAMPLE)
  attach_file("principal_all_homes_image", IMAGE_EXAMPLE)

  click_button "Criar Página Principal"
end

def fail_at_create_new_principal
  prepare_to_create_principal
  click_button "Criar Página Principal"
  page.should have_content("não pode ficar em branco")
end

def show_principal_details_validator
  page.should_not have_button("Criar Página Principal")
  page.should have_content(I18n.t("activerecord.models.principal"))
  page.should have_content(I18n.t("activerecord.attributes.principal.id"))
  page.should have_content("Princiapl título")
  page.should have_content("Descrição principal")
end