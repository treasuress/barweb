require 'spec_helper'

describe Country do

  it "create country success" do
    Country.create(new_country_hash)
    Country.count().should == 1
  end

  it "error on create country" do
    Country.create({:name => nil})
    Country.count().should == 0
  end

end