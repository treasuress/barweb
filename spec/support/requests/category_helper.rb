#encoding: UTF-8

def prepare_category_tests
  @admin_user.save
  visit admin_categories_path
end

def create_category_with_success
  create_category
end

def fail_at_create_category
  fail_at_create_new_category
end

private
def create_category
  prepare_to_create_category
  fill_in_category
  show_category_details_validator
end

def prepare_to_create_category
  click_link "Novo(a) Categoria"
end

def fill_in_category
  fill_in "category_name", :with => "Bares"
  fill_in "category_description", :with => "Todos os bares"
  attach_file("category_category_image", IMAGE_EXAMPLE)

  click_button "Criar Categoria"
end

def fail_at_create_new_category
  prepare_to_create_category
  click_button "Criar Categoria"
  page.should have_content("não pode ficar em branco")
end

def show_category_details_validator
  page.should_not have_button("Criar Categoria")
  page.should have_content(I18n.t("activerecord.models.category"))
  page.should have_content(I18n.t("activerecord.attributes.category.id"))
  page.should have_content("Bares")
  page.should have_content("Todos os bares")
end