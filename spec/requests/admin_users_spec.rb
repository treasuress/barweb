require 'spec_helper'

describe AdminUser do
  describe "GET /admin_user/index", :js => true do
    before do
      prepare_session_tests
      prepare_admin_user_tests
    end

    context "On WEB" do

      it "should create a new admin" do
        sign_in_admin_with_success
        create_admin_user_with_success
      end

      it "should fail at create a new admin" do
        sign_in_admin_with_success
        fail_at_create_admin_user
      end

      it "should show all admin users" do
        sign_in_admin_with_success
        show_index_admin_users_with_success
      end

      it "should edit the admin" do
        sign_in_admin_with_success
        create_admin_user_with_success
        edit_admin_user_with_success
      end

      it "should fail at edit the admin" do
        sign_in_admin_with_success
        create_admin_user_with_success
        fail_at_edit_admin_user
      end

      it "should delete the admin" do
        sign_in_admin_with_success
        delete_admin_user_with_success
      end

    end
  end
end