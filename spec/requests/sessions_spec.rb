#encoding: UTF-8
require 'spec_helper'

describe "Sing in", :js => true do

  before do
    prepare_session_tests
  end

  describe "Sing In", :js => true do

    before do
      prepare_session_tests
    end

    context "POST/Admin/sing_in" do
      context "On WEB" do
        before do
          @spot = "web"
        end

        it "should successfully sign in" do
          sign_in_admin_with_success
        end

        it "should fail at sign in" do
          sign_in_admin_with_failure
        end

      end
    end
  end
end


describe "Sign Out", :js => true do
  before do
    prepare_session_tests
  end

  describe "GET /users/sign_out" do
    context "On WEB" do
      before do
        @spot = "web"
      end

      it "should successfully sign out" do
        sign_in_admin_with_success
        sign_out_admin_with_success
      end

    end
  end
end