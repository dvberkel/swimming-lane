require 'diagram'

describe "A diagram" do
  it "should be created" do
    diagram = Diagram.new()

    diagram.should_not be nil
  end
end
