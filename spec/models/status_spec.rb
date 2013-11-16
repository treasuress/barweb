require 'spec_helper'

describe Status do

  it "create status success" do
    Status.create(new_status_hash)
    Status.count().should == 1
  end

end