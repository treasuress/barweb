require 'spec_helper'

describe HomeBar do
  describe "GET /home_bar/index", :js => true do
    before do
      prepare_session_tests
      prepare_home_bar_tests
    end

    context "On WEB" do

      it "should create a new home_bar" do
        sign_in_admin_with_success
        create_home_bar_with_success
      end

      #todo now - arrumar
      #it "should fail at create a duplicate home_bar" do
      #  sign_in_admin_with_success
      #  create_home_bar_duplicate
      #end

      it "should fail at create a new home_bar" do
        sign_in_admin_with_success
        fail_at_create_home_bar
      end

    end
  end
end