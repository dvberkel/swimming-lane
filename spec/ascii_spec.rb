require 'ascii'

describe "An ascii brush" do
  it "should brush NullScreens with a space" do
    brush = AsciiBrush.new()

    NullScreen.new.renderOn brush

    brush.to_s.should == " "
  end

  it "should brush Screens with a star" do
    brush = AsciiBrush.new()

    Screen.new("any").renderOn brush

    brush.to_s.should == "*"
  end

  it "should brush Moments in order of Lanes" do
    brush = AsciiBrush.new(Lane.new("a"), Lane.new("b"))
    
    Moment.new(Lane.new("a",Screen.new("any"))).renderOn brush

    brush.to_s.should == "| * | |   | "
  end

  it "should brush Diagrams in order of Moments" do
    brush = AsciiBrush.new(Lane.new("a"), Lane.new("b"))
    diagram = Diagram.new()
    diagram.add(Moment.new(Lane.new("a", Screen.new("any"))))
    diagram.add(Moment.new(Lane.new("b", Screen.new("any"))))

    
    diagram.renderOn brush

    brush.to_s.should == "| * | |   | \n|   | | * | \n"
  end
end
