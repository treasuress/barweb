require 'spec_helper'

describe State do

  it "create state success" do
    State.create(new_state_hash)
    State.count().should == 1
  end

  it "error on create state" do
    State.create({:name => nil})
    State.count().should == 0
  end

end