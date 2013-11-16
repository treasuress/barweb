require 'spec_helper'

describe AdminUser do

  it "create AdminUser success" do
    AdminUser.create(new_admin_user_hash)
    AdminUser.count().should == 1
  end

  it "error on create AdminUser" do
    AdminUser.create({:email => nil})
    AdminUser.count().should == 0
  end

end