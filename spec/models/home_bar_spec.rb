require 'spec_helper'

describe HomeBar do

  it "create HomeBar success - complete" do
    HomeBar.create(new_home_bar_hash)
    HomeBar.count().should == 1
  end

  it "error on create duplicate HomeBar" do
    HomeBar.create(new_home_bar_hash)
    HomeBar.create(new_home_bar_hash)
    HomeBar.count().should == 1
  end

  it "error on create HomeBar" do
    HomeBar.create({:name => nil})
    HomeBar.count().should == 0
  end

  it "error on create HomeBar - complete address missing" do

  end

  #todo futuro - criar teste q associa as classes aqui e onde mais precisar
  it "associate category on HomeBar" do
    #Category.create(new_category_hash)
    #categories = Category.all
    #home_bar_hash = new_home_bar_hash.merge({:categories => categories})
    #HomeBar.create(home_bar_hash)
    #HomeBar.all.count.should == 1
    #home_bar = HomeBar.first
    #home_bar.categories.count.should == 1

    #new_home_bar_hash.merge!({:category => new_category_hash})
    #HomeBar.create(new_home_bar_hash)
    #HomeBar.all.count.should == 1
    #home_bar = HomeBar.first
    #home_bar.category.count.should == 1


    #home_bar_hash = new_home_bar_hash.merge!({:category_id => new_category_hash})
    #HomeBar.create(home_bar_hash)
    #HomeBar.all.count.should == 1
    #home_bar = HomeBar.first
    #home_bar.category.count.should == 1
  end

end