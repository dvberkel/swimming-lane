require 'set'
require 'diagram'
require 'moment'
require 'lane'

describe "A diagram" do
  before(:each) do
    @diagram = Diagram.new(Lane.new("a"))
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

  it "should have all the lanes introduced by a moment" do
    @diagram.add(Moment.new(Lane.new("a"), Lane.new("b")))

    @diagram.lanes.should == [Lane.new("a"), Lane.new("b")].to_set
  end

  it "should have all the lanes introduced, even by different moments" do
    @diagram.add(Moment.new(Lane.new("a")))
    @diagram.add(Moment.new(Lane.new("b")))

    @diagram.lanes.should == [Lane.new("a"), Lane.new("b")].to_set
  end

  it "should allow iteration of moments" do
    @diagram.add(Moment.new)
    @diagram.add(Moment.new)
    count = 0

    @diagram.moments {|moment| count += 1}

    count.should == 2
  end

  it "should have a start lane" do
    @diagram.start.should == Lane.new("a")
  end
end
