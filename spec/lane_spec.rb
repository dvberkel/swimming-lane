describe "A lane" do
  it "should be named" do
    expected = "a"
    lane = Lane.new(expected)
    
    actual = lane.name

    actual.should == expected
  end

  it "should be able to hold a screen" do
    expected = Screen.new("description")
    lane = Lane.new("any", expected)

    actual = lane.screen

    actual.should == expected
  end

  it "should be able to transition to other lane" do
    any = Lane.new("any")
    other = Lane.new("other")
    
    any.transitionTo(Lane.new("other"))

    any.transition.should == Transition.new(any, other)
  end
end
