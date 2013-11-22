require 'spec_helper'

describe Principal do
  describe "GET /principal/index", :js => true do
    before do
      prepare_session_tests
      prepare_principal_tests
    end

    context "On WEB" do

      it "should create a new principal" do
        sign_in_admin_with_success
        create_principal_with_success
      end

      it "should fail at create a new principal" do
        sign_in_admin_with_success
        fail_at_create_principal
      end

    end
  end
end