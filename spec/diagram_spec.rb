require 'set'
require 'diagram'
require 'moment'
require 'lane'

describe "A diagram" do
  before(:each) do
    @diagram = Diagram.new()
  end

  it "should be created" do
    @diagram.should_not be nil
  end

  it "should have no lanes to start with" do
    @diagram.lanes.should == [].to_set
  end

  it "should have the lane introduced by a moment" do
    @diagram.add(Moment.new(Lane.new("a")))

    @diagram.lanes.should == [Lane.new("a")].to_set
  end
end
