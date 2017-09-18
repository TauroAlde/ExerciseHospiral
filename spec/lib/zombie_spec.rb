require "spec_helper"
require "zombie"

describe Zombie do
  it "is named Pene" do
    zombie = Zombie.new
    zombie.name.should == 'pene'
  end
end