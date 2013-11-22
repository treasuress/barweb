require 'spec_helper'

describe Category do
  describe "GET /category/index", :js => true do
    before do
      prepare_session_tests
      prepare_category_tests
    end

    context "On WEB" do

      it "should create a new category" do
        sign_in_admin_with_success
        create_category_with_success
      end

      it "should fail at create a duplicate category" do
        sign_in_admin_with_success
        create_category_duplicate
      end

      it "should fail at create a new category" do
        sign_in_admin_with_success
        fail_at_create_category
      end

    end
  end
end