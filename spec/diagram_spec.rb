require 'set'
require 'diagram'
require 'moment'
require 'lane'

def countMoments(diagram)
  count = 0
  diagram.moments {|moment| count += 1}
  count
end

describe "A diagram" do
  before(:each) do
    @diagram = Diagram.new(Lane.new("a"))
  end

  it "should be created" do
    @diagram.should_not be nil
  end

  it "should accept moment with one lane" do
    @diagram.add(Moment.new(Lane.new("a")))

    countMoments(@diagram).should == 1
  end

  it "should accept a moment with two lanes" do
    @diagram.add(Moment.new(Lane.new("a"), Lane.new("b")))

    countMoments(@diagram).should == 1
  end

  it "should allow iteration of moments" do
    @diagram.add(Moment.new)
    @diagram.add(Moment.new)

    countMoments(@diagram).should == 2
  end

  it "should have a start lane" do
    @diagram.start.should == Lane.new("a")
  end
end
