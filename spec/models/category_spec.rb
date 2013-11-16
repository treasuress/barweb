require 'spec_helper'

describe Category do

  it "create category success" do
    Category.create(new_category_hash)
    Category.count().should == 1
  end

  it "error on create category" do
    Category.create({:name => nil})
    Category.count().should == 0
  end

end