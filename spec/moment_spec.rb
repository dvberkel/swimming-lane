describe "A moment" do
  it "should have lanes" do
    moment = Moment.new(Lane.new("a"), Lane.new("b"))

    moment.lanes.should == [Lane.new("a"), Lane.new("b")].to_set
  end

  it "should return current lane if it did not participate" do
    moment = Moment.new(Lane.new("a").transitionTo(Lane.new("b")))
    currentLane = Lane.new("c")

    nextLane = moment.nextLane(currentLane)

    nextLane.should == currentLane
  end

  it "should return next lane if it did participate" do
    start, finish = Lane.new("a"), Lane.new("b")
    moment = Moment.new(start.transitionTo(finish))

    nextLane = moment.nextLane(start)

    nextLane.should == finish
  end
end
