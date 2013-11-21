require 'spec_helper'

describe City do

  it "create city success" do
    City.create(new_city_hash)
    City.count().should == 1
  end

  it "error on create city" do
    City.create({:name => nil})
    City.count().should == 0
  end

end