require 'spec_helper'

describe Status do

  it "create status success" do
    Status.create(new_status_hash)
    Status.count().should == 1
  end

  it "error on create duplicate status" do
    Status.create(new_status_hash)
    Status.create(new_status_hash)
    Status.count().should == 1
  end

  it "error on create status" do
    Status.create({:name => nil})
    Status.count().should == 0
  end

end