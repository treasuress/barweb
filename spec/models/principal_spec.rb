require 'spec_helper'

describe Principal do

  it "create Principal success" do
    Principal.create(new_principal_hash)
    Principal.count().should == 1
  end

  it "error on create Principal" do
    Principal.create({:title => nil})
    Principal.count().should == 0
  end

end